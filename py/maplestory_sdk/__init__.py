# Maplestory SDK

from maplestory_sdk.utility.voxgig_struct import voxgig_struct as vs
from maplestory_sdk.core.utility_type import MaplestoryUtility
from maplestory_sdk.core.spec import MaplestorySpec
from maplestory_sdk.core import helpers

# Load utility registration (populates Utility._registrar)
from maplestory_sdk.utility import register

# Load features
from maplestory_sdk.feature.base_feature import MaplestoryBaseFeature
from maplestory_sdk.features import _make_feature


class MaplestorySDK:

    def __init__(self, options=None):
        self.mode = "live"
        self.features = []
        self.options = None

        utility = MaplestoryUtility()
        self._utility = utility

        from maplestory_sdk.config import make_config
        config = make_config()

        self._rootctx = utility.make_context({
            "client": self,
            "utility": utility,
            "config": config,
            "options": options if options is not None else {},
            "shared": {},
        }, None)

        self.options = utility.make_options(self._rootctx)

        if vs.getpath(self.options, "feature.test.active") is True:
            self.mode = "test"

        self._rootctx.options = self.options

        # Add features in the resolved order (make_options puts an explicit
        # list order first, else defaults to test-first). Ordering matters: the
        # `test` feature installs the base mock transport and the transport
        # features (retry/cache/netsim/proxy/ratelimit) wrap whatever is
        # current, so `test` must be added before them to sit at the base.
        feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
        if feature_opts is not None:
            featureorder = vs.getpath(self.options, "__derived__.featureorder")
            if isinstance(featureorder, list):
                for fname in featureorder:
                    fopts = helpers.to_map(feature_opts.get(fname))
                    if fopts is not None and fopts.get("active") is True:
                        utility.feature_add(self._rootctx, _make_feature(fname))

        # Add extension features.
        extend = vs.getprop(self.options, "extend")
        if isinstance(extend, list):
            for f in extend:
                if isinstance(f, dict) or (hasattr(f, "get_name") and callable(f.get_name)):
                    utility.feature_add(self._rootctx, f)

        # Initialize features.
        for f in self.features:
            utility.feature_init(self._rootctx, f)

        utility.feature_hook(self._rootctx, "PostConstruct")

        # #BuildFeatures

    def options_map(self):
        out = vs.clone(self.options)
        if isinstance(out, dict):
            return out
        return {}

    def get_utility(self):
        return MaplestoryUtility.copy(self._utility)

    def get_root_ctx(self):
        return self._rootctx

    def prepare(self, fetchargs=None):
        utility = self._utility

        if fetchargs is None:
            fetchargs = {}

        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "prepare",
            "ctrl": ctrl,
        }, self._rootctx)

        options = self.options

        path = vs.getprop(fetchargs, "path") or ""
        if not isinstance(path, str):
            path = ""

        method = vs.getprop(fetchargs, "method") or "GET"
        if not isinstance(method, str):
            method = "GET"

        params = helpers.to_map(vs.getprop(fetchargs, "params"))
        if params is None:
            params = {}
        query = helpers.to_map(vs.getprop(fetchargs, "query"))
        if query is None:
            query = {}

        headers = utility.prepare_headers(ctx)

        base = vs.getprop(options, "base") or ""
        if not isinstance(base, str):
            base = ""
        prefix = vs.getprop(options, "prefix") or ""
        if not isinstance(prefix, str):
            prefix = ""
        suffix = vs.getprop(options, "suffix") or ""
        if not isinstance(suffix, str):
            suffix = ""

        ctx.spec = MaplestorySpec({
            "base": base,
            "prefix": prefix,
            "suffix": suffix,
            "path": path,
            "method": method,
            "params": params,
            "query": query,
            "headers": headers,
            "body": vs.getprop(fetchargs, "body"),
            "step": "start",
        })

        # Merge user-provided headers.
        uh = vs.getprop(fetchargs, "headers")
        if isinstance(uh, dict):
            for k, v in uh.items():
                ctx.spec.headers[k] = v

        _, err = utility.prepare_auth(ctx)
        if err is not None:
            raise err

        fetchdef, err = utility.make_fetch_def(ctx)
        if err is not None:
            raise err

        return fetchdef

    # Raw endpoint access is operator-controllable, like every entity op.
    # Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
    # either one reaches the same endpoint.
    def direct(self, fetchargs=None):
        if not self._op_allowed("direct"):
            return self._op_denied("direct")

        return self._raw_request(fetchargs)

    # Is this raw-access op permitted by the SDK's allow.op option?
    def _op_allowed(self, op):
        allow_op = vs.getpath(self.options, "allow.op")
        return isinstance(allow_op, str) and op in allow_op

    def _op_denied(self, op):
        allow_op = vs.getpath(self.options, "allow.op")
        return {
            "ok": False,
            "err": Exception(
                "MaplestorySDK: " + op + ": operation not allowed by"
                ' SDK option allow.op value: "' + str(allow_op) + '"'),
        }

    # Ungated request path shared by direct and graphql, each of which checks
    # its own allow.op token first. Private, rather than a flag on fetchargs:
    # a caller-supplied marker would let anyone opt straight back out of the
    # gate by passing it.
    def _raw_request(self, fetchargs=None):
        utility = self._utility

        try:
            fetchdef = self.prepare(fetchargs)
        except Exception as err:
            # direct() is the raw-HTTP escape hatch: it never raises, it
            # returns a result object callers branch on via result["ok"].
            return {"ok": False, "err": err}

        if fetchargs is None:
            fetchargs = {}
        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "direct",
            "ctrl": ctrl,
        }, self._rootctx)

        url = fetchdef.get("url", "")
        fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

        if fetch_err is not None:
            return {"ok": False, "err": fetch_err}

        if fetched is None:
            return {
                "ok": False,
                "err": ctx.make_error("direct_no_response", "response: undefined"),
            }

        if isinstance(fetched, dict):
            status = helpers.to_int(vs.getprop(fetched, "status"))
            headers = vs.getprop(fetched, "headers") or {}

            # No-body responses (204, 304) and explicit zero content-length
            # must skip JSON parsing — calling json() on an empty body raises.
            content_length = None
            if isinstance(headers, dict):
                content_length = headers.get("content-length")
            no_body = status in (204, 304) or str(content_length) == "0"

            json_data = None
            if not no_body:
                jf = vs.getprop(fetched, "json")
                if callable(jf):
                    try:
                        json_data = jf()
                    except Exception:
                        # Non-JSON body (e.g. text/plain, text/html). Surface
                        # status + headers but leave data as None.
                        json_data = None

            return {
                "ok": status >= 200 and status < 300,
                "status": status,
                "headers": headers,
                "data": json_data,
            }

        return {
            "ok": False,
            "err": ctx.make_error("direct_invalid", "invalid response type"),
        }

    # Raw GraphQL access: the pressure valve that makes the generated
    # surface's deliberate omissions (per-call selection sets, typed filter
    # builders, batching, subscriptions) livable — the whole schema stays
    # reachable.
    #
    # Thin wrapper over the same prepare/fetch path direct uses, with the one
    # thing raw direct cannot do for GraphQL: a GraphQL failure rides HTTP 200
    # as a top-level `errors` array, so status alone would report a failed
    # query as ok.
    #
    # NOTE: like direct, this bypasses the feature pipeline — no retry,
    # ratelimit or paging features apply.
    def graphql(self, query, variables=None, ctrl=None):
        if not self._op_allowed("graphql"):
            return self._op_denied("graphql")

        res = self._raw_request({
            "method": "POST",
            "headers": {"content-type": "application/json"},
            "body": {"query": query, "variables": variables or {}},
            "ctrl": ctrl or {},
        })

        # Errors are read BEFORE any status check: a GraphQL parse or
        # validation failure comes back as HTTP 400 carrying the standard
        # { errors: [...] } body, and the raw path represents a non-2xx as
        # ok:False with no err — so returning early on status would discard
        # the server's own diagnostics, which are the only useful part of
        # that response.
        errors = vs.getpath(res, "data.errors")

        if isinstance(errors, list) and 0 < len(errors):
            first = errors[0] if isinstance(errors[0], dict) else {}
            msg = first.get("message") or "graphql error"
            res["ok"] = False
            res["err"] = Exception("MaplestorySDK: graphql: " + str(msg))
            res["graphql"] = errors

        return res


    def Android(self, data=None) -> "AndroidEntity":
        """Entity factory: client.Android().list() / client.Android().load({"id": ...})."""
        from maplestory_sdk.entity.android_entity import AndroidEntity
        return AndroidEntity(self, data)


    def Avatar(self, data=None) -> "AvatarEntity":
        """Entity factory: client.Avatar().list() / client.Avatar().load({"id": ...})."""
        from maplestory_sdk.entity.avatar_entity import AvatarEntity
        return AvatarEntity(self, data)


    def Cache(self, data=None) -> "CacheEntity":
        """Entity factory: client.Cache().list() / client.Cache().load({"id": ...})."""
        from maplestory_sdk.entity.cache_entity import CacheEntity
        return CacheEntity(self, data)


    def Character(self, data=None) -> "CharacterEntity":
        """Entity factory: client.Character().list() / client.Character().load({"id": ...})."""
        from maplestory_sdk.entity.character_entity import CharacterEntity
        return CharacterEntity(self, data)


    def Chat(self, data=None) -> "ChatEntity":
        """Entity factory: client.Chat().list() / client.Chat().load({"id": ...})."""
        from maplestory_sdk.entity.chat_entity import ChatEntity
        return ChatEntity(self, data)


    def Cluster(self, data=None) -> "ClusterEntity":
        """Entity factory: client.Cluster().list() / client.Cluster().load({"id": ...})."""
        from maplestory_sdk.entity.cluster_entity import ClusterEntity
        return ClusterEntity(self, data)


    def Diff(self, data=None) -> "DiffEntity":
        """Entity factory: client.Diff().list() / client.Diff().load({"id": ...})."""
        from maplestory_sdk.entity.diff_entity import DiffEntity
        return DiffEntity(self, data)


    def Entity1(self, data=None) -> "Entity1Entity":
        """Entity factory: client.Entity1().list() / client.Entity1().load({"id": ...})."""
        from maplestory_sdk.entity.entity1_entity import Entity1Entity
        return Entity1Entity(self, data)


    def GmsNew(self, data=None) -> "GmsNewEntity":
        """Entity factory: client.GmsNew().list() / client.GmsNew().load({"id": ...})."""
        from maplestory_sdk.entity.gms_new_entity import GmsNewEntity
        return GmsNewEntity(self, data)


    def GuildMark(self, data=None) -> "GuildMarkEntity":
        """Entity factory: client.GuildMark().list() / client.GuildMark().load({"id": ...})."""
        from maplestory_sdk.entity.guild_mark_entity import GuildMarkEntity
        return GuildMarkEntity(self, data)


    def Health(self, data=None) -> "HealthEntity":
        """Entity factory: client.Health().list() / client.Health().load({"id": ...})."""
        from maplestory_sdk.entity.health_entity import HealthEntity
        return HealthEntity(self, data)


    def Item(self, data=None) -> "ItemEntity":
        """Entity factory: client.Item().list() / client.Item().load({"id": ...})."""
        from maplestory_sdk.entity.item_entity import ItemEntity
        return ItemEntity(self, data)


    def Job(self, data=None) -> "JobEntity":
        """Entity factory: client.Job().list() / client.Job().load({"id": ...})."""
        from maplestory_sdk.entity.job_entity import JobEntity
        return JobEntity(self, data)


    def Map(self, data=None) -> "MapEntity":
        """Entity factory: client.Map().list() / client.Map().load({"id": ...})."""
        from maplestory_sdk.entity.map_entity import MapEntity
        return MapEntity(self, data)


    def Metric(self, data=None) -> "MetricEntity":
        """Entity factory: client.Metric().list() / client.Metric().load({"id": ...})."""
        from maplestory_sdk.entity.metric_entity import MetricEntity
        return MetricEntity(self, data)


    def Mob(self, data=None) -> "MobEntity":
        """Entity factory: client.Mob().list() / client.Mob().load({"id": ...})."""
        from maplestory_sdk.entity.mob_entity import MobEntity
        return MobEntity(self, data)


    def Music(self, data=None) -> "MusicEntity":
        """Entity factory: client.Music().list() / client.Music().load({"id": ...})."""
        from maplestory_sdk.entity.music_entity import MusicEntity
        return MusicEntity(self, data)


    def Name(self, data=None) -> "NameEntity":
        """Entity factory: client.Name().list() / client.Name().load({"id": ...})."""
        from maplestory_sdk.entity.name_entity import NameEntity
        return NameEntity(self, data)


    def Npc(self, data=None) -> "NpcEntity":
        """Entity factory: client.Npc().list() / client.Npc().load({"id": ...})."""
        from maplestory_sdk.entity.npc_entity import NpcEntity
        return NpcEntity(self, data)


    def Nxf(self, data=None) -> "NxfEntity":
        """Entity factory: client.Nxf().list() / client.Nxf().load({"id": ...})."""
        from maplestory_sdk.entity.nxf_entity import NxfEntity
        return NxfEntity(self, data)


    def PerformanceMetric(self, data=None) -> "PerformanceMetricEntity":
        """Entity factory: client.PerformanceMetric().list() / client.PerformanceMetric().load({"id": ...})."""
        from maplestory_sdk.entity.performance_metric_entity import PerformanceMetricEntity
        return PerformanceMetricEntity(self, data)


    def Pet(self, data=None) -> "PetEntity":
        """Entity factory: client.Pet().list() / client.Pet().load({"id": ...})."""
        from maplestory_sdk.entity.pet_entity import PetEntity
        return PetEntity(self, data)


    def Quest(self, data=None) -> "QuestEntity":
        """Entity factory: client.Quest().list() / client.Quest().load({"id": ...})."""
        from maplestory_sdk.entity.quest_entity import QuestEntity
        return QuestEntity(self, data)


    def System(self, data=None) -> "SystemEntity":
        """Entity factory: client.System().list() / client.System().load({"id": ...})."""
        from maplestory_sdk.entity.system_entity import SystemEntity
        return SystemEntity(self, data)


    def Tip(self, data=None) -> "TipEntity":
        """Entity factory: client.Tip().list() / client.Tip().load({"id": ...})."""
        from maplestory_sdk.entity.tip_entity import TipEntity
        return TipEntity(self, data)


    def Wzn(self, data=None) -> "WznEntity":
        """Entity factory: client.Wzn().list() / client.Wzn().load({"id": ...})."""
        from maplestory_sdk.entity.wzn_entity import WznEntity
        return WznEntity(self, data)


    def ZMap(self, data=None) -> "ZMapEntity":
        """Entity factory: client.ZMap().list() / client.ZMap().load({"id": ...})."""
        from maplestory_sdk.entity.z_map_entity import ZMapEntity
        return ZMapEntity(self, data)



    @classmethod
    def test(cls, testopts=None, sdkopts=None) -> "MaplestorySDK":
        if sdkopts is None:
            sdkopts = {}
        sdkopts = vs.clone(sdkopts)
        if not isinstance(sdkopts, dict):
            sdkopts = {}

        if testopts is None:
            testopts = {}
        testopts = vs.clone(testopts)
        if not isinstance(testopts, dict):
            testopts = {}
        testopts["active"] = True

        vs.setpath(sdkopts, "feature.test", testopts)

        sdk = cls(sdkopts)
        sdk.mode = "test"

        return sdk


from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from maplestory_sdk.entity.android_entity import AndroidEntity
    from maplestory_sdk.entity.avatar_entity import AvatarEntity
    from maplestory_sdk.entity.cache_entity import CacheEntity
    from maplestory_sdk.entity.character_entity import CharacterEntity
    from maplestory_sdk.entity.chat_entity import ChatEntity
    from maplestory_sdk.entity.cluster_entity import ClusterEntity
    from maplestory_sdk.entity.diff_entity import DiffEntity
    from maplestory_sdk.entity.entity1_entity import Entity1Entity
    from maplestory_sdk.entity.gms_new_entity import GmsNewEntity
    from maplestory_sdk.entity.guild_mark_entity import GuildMarkEntity
    from maplestory_sdk.entity.health_entity import HealthEntity
    from maplestory_sdk.entity.item_entity import ItemEntity
    from maplestory_sdk.entity.job_entity import JobEntity
    from maplestory_sdk.entity.map_entity import MapEntity
    from maplestory_sdk.entity.metric_entity import MetricEntity
    from maplestory_sdk.entity.mob_entity import MobEntity
    from maplestory_sdk.entity.music_entity import MusicEntity
    from maplestory_sdk.entity.name_entity import NameEntity
    from maplestory_sdk.entity.npc_entity import NpcEntity
    from maplestory_sdk.entity.nxf_entity import NxfEntity
    from maplestory_sdk.entity.performance_metric_entity import PerformanceMetricEntity
    from maplestory_sdk.entity.pet_entity import PetEntity
    from maplestory_sdk.entity.quest_entity import QuestEntity
    from maplestory_sdk.entity.system_entity import SystemEntity
    from maplestory_sdk.entity.tip_entity import TipEntity
    from maplestory_sdk.entity.wzn_entity import WznEntity
    from maplestory_sdk.entity.z_map_entity import ZMapEntity
