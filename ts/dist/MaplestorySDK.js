"use strict";
// Maplestory Ts SDK
Object.defineProperty(exports, "__esModule", { value: true });
exports.SDK = exports.MaplestorySDK = exports.MaplestoryEntityBase = exports.BaseFeature = exports.config = exports.stdutil = void 0;
const AndroidEntity_1 = require("./entity/AndroidEntity");
const AvatarEntity_1 = require("./entity/AvatarEntity");
const CacheEntity_1 = require("./entity/CacheEntity");
const CharacterEntity_1 = require("./entity/CharacterEntity");
const ChatEntity_1 = require("./entity/ChatEntity");
const ClusterEntity_1 = require("./entity/ClusterEntity");
const DiffEntity_1 = require("./entity/DiffEntity");
const Entity1Entity_1 = require("./entity/Entity1Entity");
const GmsNewEntity_1 = require("./entity/GmsNewEntity");
const GuildMarkEntity_1 = require("./entity/GuildMarkEntity");
const HealthEntity_1 = require("./entity/HealthEntity");
const ItemEntity_1 = require("./entity/ItemEntity");
const JobEntity_1 = require("./entity/JobEntity");
const MapEntity_1 = require("./entity/MapEntity");
const MetricEntity_1 = require("./entity/MetricEntity");
const MobEntity_1 = require("./entity/MobEntity");
const MusicEntity_1 = require("./entity/MusicEntity");
const NameEntity_1 = require("./entity/NameEntity");
const NpcEntity_1 = require("./entity/NpcEntity");
const NxfEntity_1 = require("./entity/NxfEntity");
const PerformanceMetricEntity_1 = require("./entity/PerformanceMetricEntity");
const PetEntity_1 = require("./entity/PetEntity");
const QuestEntity_1 = require("./entity/QuestEntity");
const SystemEntity_1 = require("./entity/SystemEntity");
const TipEntity_1 = require("./entity/TipEntity");
const WznEntity_1 = require("./entity/WznEntity");
const ZMapEntity_1 = require("./entity/ZMapEntity");
const node_util_1 = require("node:util");
const Config_1 = require("./Config");
Object.defineProperty(exports, "config", { enumerable: true, get: function () { return Config_1.config; } });
const MaplestoryEntityBase_1 = require("./MaplestoryEntityBase");
Object.defineProperty(exports, "MaplestoryEntityBase", { enumerable: true, get: function () { return MaplestoryEntityBase_1.MaplestoryEntityBase; } });
const Utility_1 = require("./utility/Utility");
const BaseFeature_1 = require("./feature/base/BaseFeature");
Object.defineProperty(exports, "BaseFeature", { enumerable: true, get: function () { return BaseFeature_1.BaseFeature; } });
const stdutil = new Utility_1.Utility();
exports.stdutil = stdutil;
class MaplestorySDK {
    _mode = 'live';
    _options;
    _utility = new Utility_1.Utility();
    _features;
    _rootctx;
    constructor(options) {
        this._rootctx = this._utility.makeContext({
            client: this,
            utility: this._utility,
            config: Config_1.config,
            options,
            shared: new WeakMap()
        });
        this._options = this._utility.makeOptions(this._rootctx);
        const struct = this._utility.struct;
        const getpath = struct.getpath;
        if (true === getpath(this._options.feature, 'test.active')) {
            this._mode = 'test';
        }
        this._rootctx.options = this._options;
        this._features = [];
        const featureAdd = this._utility.featureAdd;
        const featureInit = this._utility.featureInit;
        // Add features in the resolved order (makeOptions puts an explicit
        // array order first, else defaults to test-first). Ordering matters:
        // the `test` feature installs the base mock transport and the transport
        // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is current,
        // so `test` must be added before them to sit at the base of the chain.
        const extend = this._options.extend || [];
        const featureorder = getpath(this._options, '__derived__.featureorder') || [];
        for (const fname of featureorder) {
            const fopts = this._options.feature[fname] || {};
            if (fopts.active) {
                // An active name with no generated class is legal when an
                // extend-supplied instance carries that name (station's adopt
                // path): the instance is added below, positioned by its own
                // __after__ entry, so skip it here rather than fail construction.
                if (!this._rootctx.config.hasFeature(fname) &&
                    extend.some((f) => fname === f.name)) {
                    continue;
                }
                featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname));
            }
        }
        for (let f of extend) {
            featureAdd(this._rootctx, f);
        }
        for (let f of this._features) {
            featureInit(this._rootctx, f);
        }
        const featureHook = this._utility.featureHook;
        featureHook(this._rootctx, 'PostConstruct');
    }
    options() {
        return this._utility.struct.clone(this._options);
    }
    utility() {
        return this._utility.struct.clone(this._utility);
    }
    async prepare(fetchargs) {
        const utility = this._utility;
        const struct = utility.struct;
        const clone = struct.clone;
        const { makeContext, makeFetchDef, prepareHeaders, prepareAuth, } = utility;
        fetchargs = fetchargs || {};
        let ctx = makeContext({
            opname: 'prepare',
            ctrl: fetchargs.ctrl || {},
        }, this._rootctx);
        const options = this._options;
        // Build spec directly from SDK options + user-provided fetch args.
        const spec = {
            base: options.base,
            prefix: options.prefix,
            suffix: options.suffix,
            path: fetchargs.path || '',
            method: fetchargs.method || 'GET',
            params: fetchargs.params || {},
            query: fetchargs.query || {},
            headers: prepareHeaders(ctx),
            body: fetchargs.body,
            step: 'start',
        };
        ctx.spec = spec;
        // Merge user-provided headers over SDK defaults.
        if (fetchargs.headers) {
            const uheaders = fetchargs.headers;
            for (let key in uheaders) {
                spec.headers[key] = uheaders[key];
            }
        }
        // Apply SDK auth (apikey, auth prefix, etc.)
        const authResult = prepareAuth(ctx);
        if (authResult instanceof Error) {
            return authResult;
        }
        return makeFetchDef(ctx);
    }
    // Raw endpoint access is operator-controllable, like every entity op.
    // Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
    // either one reaches the same endpoint.
    async direct(fetchargs) {
        if (!this._options.allow.op.includes('direct')) {
            return {
                ok: false,
                err: new Error('MaplestorySDK: direct: operation not allowed by' +
                    ' SDK option allow.op value: "' + this._options.allow.op + '"'),
            };
        }
        return this._rawRequest(fetchargs);
    }
    // Ungated request path shared by direct() and graphql(), each of which
    // checks its own allow.op token first. Private, rather than a flag on
    // fetchargs: a caller-supplied marker would let anyone opt straight back
    // out of the gate by passing it.
    async _rawRequest(fetchargs) {
        const utility = this._utility;
        const fetcher = utility.fetcher;
        const makeContext = utility.makeContext;
        const fetchdef = await this.prepare(fetchargs);
        if (fetchdef instanceof Error) {
            return fetchdef;
        }
        let ctx = makeContext({
            opname: 'direct',
            ctrl: (fetchargs || {}).ctrl || {},
        }, this._rootctx);
        try {
            const fetched = await fetcher(ctx, fetchdef.url, fetchdef);
            if (null == fetched) {
                return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') };
            }
            else if (fetched instanceof Error) {
                return { ok: false, err: fetched };
            }
            const status = fetched.status;
            // No body responses (204 No Content, 304 Not Modified) and explicit
            // zero content-length must skip JSON parsing — fetched.json() would
            // throw `Unexpected end of JSON input` on an empty body.
            const headers = fetched.headers;
            const contentLength = headers && 'function' === typeof headers.get
                ? headers.get('content-length')
                : (headers || {})['content-length'];
            const noBody = 204 === status || 304 === status || '0' === String(contentLength);
            let json = undefined;
            if (!noBody) {
                try {
                    json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json;
                }
                catch (parseErr) {
                    // Body wasn't valid JSON — surface the raw response rather than
                    // throwing. data stays undefined; callers can inspect status/headers.
                    json = undefined;
                }
            }
            return {
                ok: status >= 200 && status < 300,
                status,
                headers: fetched.headers,
                data: json,
            };
        }
        catch (err) {
            return { ok: false, err };
        }
    }
    // Raw GraphQL access: the pressure valve that makes the generated
    // surface's deliberate omissions (per-call selection sets, typed filter
    // builders, batching, subscriptions) livable — the whole schema stays
    // reachable.
    //
    // Thin wrapper over the same prepare/fetch path `direct` uses, with the
    // one thing raw `direct` cannot do for GraphQL: a GraphQL failure rides
    // HTTP 200 as a top-level `errors` array, so status alone would report a
    // failed query as ok.
    //
    // NOTE: like `direct`, this bypasses the feature pipeline — no retry,
    // ratelimit or paging features apply.
    async graphql(query, variables, ctrl) {
        const options = this._options;
        if (!options.allow.op.includes('graphql')) {
            return {
                ok: false,
                err: new Error('MaplestorySDK: graphql: operation not allowed by' +
                    ' SDK option allow.op value: "' + options.allow.op + '"'),
            };
        }
        const res = await this._rawRequest({
            method: 'POST',
            headers: { 'content-type': 'application/json' },
            body: { query, variables: variables || {} },
            ctrl,
        });
        if (res instanceof Error) {
            return res;
        }
        // Errors are read BEFORE any status check: a GraphQL parse or validation
        // failure comes back as HTTP 400 carrying the standard { errors: [...] }
        // body, and the raw path represents a non-2xx as { ok: false } with no
        // err — so returning early on status would discard the server's own
        // diagnostics, which are the only useful part of that response.
        const errors = null == res.data ? undefined : res.data.errors;
        if (null != errors && Array.isArray(errors) && 0 < errors.length) {
            const first = errors[0] || {};
            const err = new Error('MaplestorySDK: graphql: ' +
                (first.message || 'graphql error'));
            err.graphql = errors;
            return { ok: false, status: res.status, headers: res.headers, err, data: res.data };
        }
        return res;
    }
    // Entity access: `client.Android().list()` / `client.Android().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Android(entopts) {
        const self = this;
        return new AndroidEntity_1.AndroidEntity(self, entopts);
    }
    // Entity access: `client.Avatar().list()` / `client.Avatar().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Avatar(entopts) {
        const self = this;
        return new AvatarEntity_1.AvatarEntity(self, entopts);
    }
    // Entity access: `client.Cache().list()` / `client.Cache().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Cache(entopts) {
        const self = this;
        return new CacheEntity_1.CacheEntity(self, entopts);
    }
    // Entity access: `client.Character().list()` / `client.Character().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Character(entopts) {
        const self = this;
        return new CharacterEntity_1.CharacterEntity(self, entopts);
    }
    // Entity access: `client.Chat().list()` / `client.Chat().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Chat(entopts) {
        const self = this;
        return new ChatEntity_1.ChatEntity(self, entopts);
    }
    // Entity access: `client.Cluster().list()` / `client.Cluster().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Cluster(entopts) {
        const self = this;
        return new ClusterEntity_1.ClusterEntity(self, entopts);
    }
    // Entity access: `client.Diff().list()` / `client.Diff().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Diff(entopts) {
        const self = this;
        return new DiffEntity_1.DiffEntity(self, entopts);
    }
    // Entity access: `client.Entity1().list()` / `client.Entity1().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Entity1(entopts) {
        const self = this;
        return new Entity1Entity_1.Entity1Entity(self, entopts);
    }
    // Entity access: `client.GmsNew().list()` / `client.GmsNew().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    GmsNew(entopts) {
        const self = this;
        return new GmsNewEntity_1.GmsNewEntity(self, entopts);
    }
    // Entity access: `client.GuildMark().list()` / `client.GuildMark().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    GuildMark(entopts) {
        const self = this;
        return new GuildMarkEntity_1.GuildMarkEntity(self, entopts);
    }
    // Entity access: `client.Health().list()` / `client.Health().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Health(entopts) {
        const self = this;
        return new HealthEntity_1.HealthEntity(self, entopts);
    }
    // Entity access: `client.Item().list()` / `client.Item().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Item(entopts) {
        const self = this;
        return new ItemEntity_1.ItemEntity(self, entopts);
    }
    // Entity access: `client.Job().list()` / `client.Job().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Job(entopts) {
        const self = this;
        return new JobEntity_1.JobEntity(self, entopts);
    }
    // Entity access: `client.Map().list()` / `client.Map().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Map(entopts) {
        const self = this;
        return new MapEntity_1.MapEntity(self, entopts);
    }
    // Entity access: `client.Metric().list()` / `client.Metric().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Metric(entopts) {
        const self = this;
        return new MetricEntity_1.MetricEntity(self, entopts);
    }
    // Entity access: `client.Mob().list()` / `client.Mob().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Mob(entopts) {
        const self = this;
        return new MobEntity_1.MobEntity(self, entopts);
    }
    // Entity access: `client.Music().list()` / `client.Music().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Music(entopts) {
        const self = this;
        return new MusicEntity_1.MusicEntity(self, entopts);
    }
    // Entity access: `client.Name().list()` / `client.Name().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Name(entopts) {
        const self = this;
        return new NameEntity_1.NameEntity(self, entopts);
    }
    // Entity access: `client.Npc().list()` / `client.Npc().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Npc(entopts) {
        const self = this;
        return new NpcEntity_1.NpcEntity(self, entopts);
    }
    // Entity access: `client.Nxf().list()` / `client.Nxf().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Nxf(entopts) {
        const self = this;
        return new NxfEntity_1.NxfEntity(self, entopts);
    }
    // Entity access: `client.PerformanceMetric().list()` / `client.PerformanceMetric().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    PerformanceMetric(entopts) {
        const self = this;
        return new PerformanceMetricEntity_1.PerformanceMetricEntity(self, entopts);
    }
    // Entity access: `client.Pet().list()` / `client.Pet().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Pet(entopts) {
        const self = this;
        return new PetEntity_1.PetEntity(self, entopts);
    }
    // Entity access: `client.Quest().list()` / `client.Quest().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Quest(entopts) {
        const self = this;
        return new QuestEntity_1.QuestEntity(self, entopts);
    }
    // Entity access: `client.System().list()` / `client.System().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    System(entopts) {
        const self = this;
        return new SystemEntity_1.SystemEntity(self, entopts);
    }
    // Entity access: `client.Tip().list()` / `client.Tip().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Tip(entopts) {
        const self = this;
        return new TipEntity_1.TipEntity(self, entopts);
    }
    // Entity access: `client.Wzn().list()` / `client.Wzn().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    Wzn(entopts) {
        const self = this;
        return new WznEntity_1.WznEntity(self, entopts);
    }
    // Entity access: `client.ZMap().list()` / `client.ZMap().load({ id })`.
    // The argument is the entity OPTIONS object (passed to the entity
    // constructor as entopts), not initial entity data.
    ZMap(entopts) {
        const self = this;
        return new ZMapEntity_1.ZMapEntity(self, entopts);
    }
    static test(testoptsarg, sdkoptsarg) {
        const struct = stdutil.struct;
        const setpath = struct.setpath;
        const getdef = struct.getdef;
        const clone = struct.clone;
        const setprop = struct.setprop;
        const sdkopts = getdef(clone(sdkoptsarg), {});
        const testopts = getdef(clone(testoptsarg), {});
        setprop(testopts, 'active', true);
        setpath(sdkopts, 'feature.test', testopts);
        const testsdk = new MaplestorySDK(sdkopts);
        testsdk._mode = 'test';
        return testsdk;
    }
    tester(testopts, sdkopts) {
        return MaplestorySDK.test(testopts, sdkopts);
    }
    toJSON() {
        return { name: 'Maplestory' };
    }
    toString() {
        return 'Maplestory ' + this._utility.struct.jsonify(this.toJSON());
    }
    [node_util_1.inspect.custom]() {
        return this.toString();
    }
}
exports.MaplestorySDK = MaplestorySDK;
const SDK = MaplestorySDK;
exports.SDK = SDK;
//# sourceMappingURL=MaplestorySDK.js.map