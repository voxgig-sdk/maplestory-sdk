// Maplestory Ts SDK

import { AndroidEntity } from './entity/AndroidEntity'
import { AvatarEntity } from './entity/AvatarEntity'
import { CacheEntity } from './entity/CacheEntity'
import { CharacterEntity } from './entity/CharacterEntity'
import { ChatEntity } from './entity/ChatEntity'
import { ClusterEntity } from './entity/ClusterEntity'
import { DiffEntity } from './entity/DiffEntity'
import { Entity1Entity } from './entity/Entity1Entity'
import { GmsNewEntity } from './entity/GmsNewEntity'
import { GuildMarkEntity } from './entity/GuildMarkEntity'
import { HealthEntity } from './entity/HealthEntity'
import { ItemEntity } from './entity/ItemEntity'
import { JobEntity } from './entity/JobEntity'
import { MapEntity } from './entity/MapEntity'
import { MetricEntity } from './entity/MetricEntity'
import { MobEntity } from './entity/MobEntity'
import { MusicEntity } from './entity/MusicEntity'
import { NameEntity } from './entity/NameEntity'
import { NpcEntity } from './entity/NpcEntity'
import { NxfEntity } from './entity/NxfEntity'
import { PerformanceMetricEntity } from './entity/PerformanceMetricEntity'
import { PetEntity } from './entity/PetEntity'
import { QuestEntity } from './entity/QuestEntity'
import { SystemEntity } from './entity/SystemEntity'
import { TipEntity } from './entity/TipEntity'
import { WznEntity } from './entity/WznEntity'
import { ZMapEntity } from './entity/ZMapEntity'

export type * from './MaplestoryTypes'


import { inspect } from 'node:util'

import type { Context, Feature } from './types'

import { config } from './Config'
import { MaplestoryEntityBase } from './MaplestoryEntityBase'
import { Utility } from './utility/Utility'


import { BaseFeature } from './feature/base/BaseFeature'


const stdutil = new Utility()


class MaplestorySDK {
  _mode: string = 'live'
  _options: any
  _utility = new Utility()
  _features: Feature[]
  _rootctx: Context

  constructor(options?: any) {

    this._rootctx = this._utility.makeContext({
      client: this,
      utility: this._utility,
      config,
      options,
      shared: new WeakMap()
    })

    this._options = this._utility.makeOptions(this._rootctx)

    const struct = this._utility.struct
    const getpath = struct.getpath

    if (true === getpath(this._options.feature, 'test.active')) {
      this._mode = 'test'
    }

    this._rootctx.options = this._options

    this._features = []

    const featureAdd = this._utility.featureAdd
    const featureInit = this._utility.featureInit

    // Add features in the resolved order (makeOptions puts an explicit
    // array order first, else defaults to test-first). Ordering matters:
    // the `test` feature installs the base mock transport and the transport
    // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is current,
    // so `test` must be added before them to sit at the base of the chain.
    const featureorder = getpath(this._options, '__derived__.featureorder') || []
    for (const fname of featureorder) {
      const fopts = this._options.feature[fname] || {}
      if (fopts.active) {
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    }

    if (null != this._options.extend) {
      for (let f of this._options.extend) {
        featureAdd(this._rootctx, f)
      }
    }

    for (let f of this._features) {
      featureInit(this._rootctx, f)
    }

    const featureHook = this._utility.featureHook
    featureHook(this._rootctx, 'PostConstruct')
  }


  options() {
    return this._utility.struct.clone(this._options)
  }


  utility() {
    return this._utility.struct.clone(this._utility)
  }


  async prepare(fetchargs?: any) {
    const utility = this._utility
    const struct = utility.struct
    const clone = struct.clone

    const {
      makeContext,
      makeFetchDef,
      prepareHeaders,
      prepareAuth,
    } = utility

    fetchargs = fetchargs || {}

    let ctx: Context = makeContext({
      opname: 'prepare',
      ctrl: fetchargs.ctrl || {},
    }, this._rootctx)

    const options = this._options

    // Build spec directly from SDK options + user-provided fetch args.
    const spec: any = {
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
    }

    ctx.spec = spec

    // Merge user-provided headers over SDK defaults.
    if (fetchargs.headers) {
      const uheaders = fetchargs.headers
      for (let key in uheaders) {
        spec.headers[key] = uheaders[key]
      }
    }

    // Apply SDK auth (apikey, auth prefix, etc.)
    const authResult = prepareAuth(ctx)
    if (authResult instanceof Error) {
      return authResult
    }

    return makeFetchDef(ctx)
  }


  // Raw endpoint access is operator-controllable, like every entity op.
  // Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
  // either one reaches the same endpoint.
  async direct(fetchargs?: any) {
    if (!this._options.allow.op.includes('direct')) {
      return {
        ok: false,
        err: new Error('MaplestorySDK: direct: operation not allowed by' +
          ' SDK option allow.op value: "' + this._options.allow.op + '"'),
      }
    }

    return this._rawRequest(fetchargs)
  }


  // Ungated request path shared by direct() and graphql(), each of which
  // checks its own allow.op token first. Private, rather than a flag on
  // fetchargs: a caller-supplied marker would let anyone opt straight back
  // out of the gate by passing it.
  async _rawRequest(fetchargs?: any) {
    const utility = this._utility

    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return fetchdef
    }

    let ctx: Context = makeContext({
      opname: 'direct',
      ctrl: (fetchargs || {}).ctrl || {},
    }, this._rootctx)

    try {
      const fetched = await fetcher(ctx, fetchdef.url, fetchdef)

      if (null == fetched) {
        return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') }
      }
      else if (fetched instanceof Error) {
        return { ok: false, err: fetched }
      }

      const status = fetched.status

      // No body responses (204 No Content, 304 Not Modified) and explicit
      // zero content-length must skip JSON parsing — fetched.json() would
      // throw `Unexpected end of JSON input` on an empty body.
      const headers = fetched.headers
      const contentLength = headers && 'function' === typeof headers.get
        ? headers.get('content-length')
        : (headers || {})['content-length']
      const noBody = 204 === status || 304 === status || '0' === String(contentLength)

      let json: any = undefined
      if (!noBody) {
        try {
          json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json
        }
        catch (parseErr) {
          // Body wasn't valid JSON — surface the raw response rather than
          // throwing. data stays undefined; callers can inspect status/headers.
          json = undefined
        }
      }

      return {
        ok: status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
      }
    }
    catch (err: any) {
      return { ok: false, err }
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
  async graphql(query: string, variables?: any, ctrl?: any) {
    const options = this._options

    if (!options.allow.op.includes('graphql')) {
      return {
        ok: false,
        err: new Error('MaplestorySDK: graphql: operation not allowed by' +
          ' SDK option allow.op value: "' + options.allow.op + '"'),
      }
    }

    const res: any = await this._rawRequest({
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: { query, variables: variables || {} },
      ctrl,
    })

    if (res instanceof Error) {
      return res
    }

    // Errors are read BEFORE any status check: a GraphQL parse or validation
    // failure comes back as HTTP 400 carrying the standard { errors: [...] }
    // body, and the raw path represents a non-2xx as { ok: false } with no
    // err — so returning early on status would discard the server's own
    // diagnostics, which are the only useful part of that response.
    const errors = null == res.data ? undefined : res.data.errors

    if (null != errors && Array.isArray(errors) && 0 < errors.length) {
      const first = errors[0] || {}
      const err: any = new Error('MaplestorySDK: graphql: ' +
        (first.message || 'graphql error'))
      err.graphql = errors
      return { ok: false, status: res.status, headers: res.headers, err, data: res.data }
    }

    return res
  }



  // Entity access: `client.Android().list()` / `client.Android().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Android(entopts?: Record<string, any>) {
    const self = this
    return new AndroidEntity(self, entopts)
  }


  // Entity access: `client.Avatar().list()` / `client.Avatar().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Avatar(entopts?: Record<string, any>) {
    const self = this
    return new AvatarEntity(self, entopts)
  }


  // Entity access: `client.Cache().list()` / `client.Cache().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Cache(entopts?: Record<string, any>) {
    const self = this
    return new CacheEntity(self, entopts)
  }


  // Entity access: `client.Character().list()` / `client.Character().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Character(entopts?: Record<string, any>) {
    const self = this
    return new CharacterEntity(self, entopts)
  }


  // Entity access: `client.Chat().list()` / `client.Chat().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Chat(entopts?: Record<string, any>) {
    const self = this
    return new ChatEntity(self, entopts)
  }


  // Entity access: `client.Cluster().list()` / `client.Cluster().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Cluster(entopts?: Record<string, any>) {
    const self = this
    return new ClusterEntity(self, entopts)
  }


  // Entity access: `client.Diff().list()` / `client.Diff().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Diff(entopts?: Record<string, any>) {
    const self = this
    return new DiffEntity(self, entopts)
  }


  // Entity access: `client.Entity1().list()` / `client.Entity1().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Entity1(entopts?: Record<string, any>) {
    const self = this
    return new Entity1Entity(self, entopts)
  }


  // Entity access: `client.GmsNew().list()` / `client.GmsNew().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  GmsNew(entopts?: Record<string, any>) {
    const self = this
    return new GmsNewEntity(self, entopts)
  }


  // Entity access: `client.GuildMark().list()` / `client.GuildMark().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  GuildMark(entopts?: Record<string, any>) {
    const self = this
    return new GuildMarkEntity(self, entopts)
  }


  // Entity access: `client.Health().list()` / `client.Health().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Health(entopts?: Record<string, any>) {
    const self = this
    return new HealthEntity(self, entopts)
  }


  // Entity access: `client.Item().list()` / `client.Item().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Item(entopts?: Record<string, any>) {
    const self = this
    return new ItemEntity(self, entopts)
  }


  // Entity access: `client.Job().list()` / `client.Job().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Job(entopts?: Record<string, any>) {
    const self = this
    return new JobEntity(self, entopts)
  }


  // Entity access: `client.Map().list()` / `client.Map().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Map(entopts?: Record<string, any>) {
    const self = this
    return new MapEntity(self, entopts)
  }


  // Entity access: `client.Metric().list()` / `client.Metric().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Metric(entopts?: Record<string, any>) {
    const self = this
    return new MetricEntity(self, entopts)
  }


  // Entity access: `client.Mob().list()` / `client.Mob().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Mob(entopts?: Record<string, any>) {
    const self = this
    return new MobEntity(self, entopts)
  }


  // Entity access: `client.Music().list()` / `client.Music().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Music(entopts?: Record<string, any>) {
    const self = this
    return new MusicEntity(self, entopts)
  }


  // Entity access: `client.Name().list()` / `client.Name().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Name(entopts?: Record<string, any>) {
    const self = this
    return new NameEntity(self, entopts)
  }


  // Entity access: `client.Npc().list()` / `client.Npc().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Npc(entopts?: Record<string, any>) {
    const self = this
    return new NpcEntity(self, entopts)
  }


  // Entity access: `client.Nxf().list()` / `client.Nxf().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Nxf(entopts?: Record<string, any>) {
    const self = this
    return new NxfEntity(self, entopts)
  }


  // Entity access: `client.PerformanceMetric().list()` / `client.PerformanceMetric().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  PerformanceMetric(entopts?: Record<string, any>) {
    const self = this
    return new PerformanceMetricEntity(self, entopts)
  }


  // Entity access: `client.Pet().list()` / `client.Pet().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Pet(entopts?: Record<string, any>) {
    const self = this
    return new PetEntity(self, entopts)
  }


  // Entity access: `client.Quest().list()` / `client.Quest().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Quest(entopts?: Record<string, any>) {
    const self = this
    return new QuestEntity(self, entopts)
  }


  // Entity access: `client.System().list()` / `client.System().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  System(entopts?: Record<string, any>) {
    const self = this
    return new SystemEntity(self, entopts)
  }


  // Entity access: `client.Tip().list()` / `client.Tip().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Tip(entopts?: Record<string, any>) {
    const self = this
    return new TipEntity(self, entopts)
  }


  // Entity access: `client.Wzn().list()` / `client.Wzn().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Wzn(entopts?: Record<string, any>) {
    const self = this
    return new WznEntity(self, entopts)
  }


  // Entity access: `client.ZMap().list()` / `client.ZMap().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  ZMap(entopts?: Record<string, any>) {
    const self = this
    return new ZMapEntity(self, entopts)
  }




  static test(testoptsarg?: any, sdkoptsarg?: any) {
    const struct = stdutil.struct
    const setpath = struct.setpath
    const getdef = struct.getdef
    const clone = struct.clone
    const setprop = struct.setprop

    const sdkopts = getdef(clone(sdkoptsarg), {})
    const testopts = getdef(clone(testoptsarg), {})
    setprop(testopts, 'active', true)
    setpath(sdkopts, 'feature.test', testopts)

    const testsdk = new MaplestorySDK(sdkopts)
    testsdk._mode = 'test'

    return testsdk
  }


  tester(testopts?: any, sdkopts?: any) {
    return MaplestorySDK.test(testopts, sdkopts)
  }


  toJSON() {
    return { name: 'Maplestory' }
  }

  toString() {
    return 'Maplestory ' + this._utility.struct.jsonify(this.toJSON())
  }

  [inspect.custom]() {
    return this.toString()
  }

}




const SDK = MaplestorySDK


export {
  stdutil,
  config,

  BaseFeature,
  MaplestoryEntityBase,

  MaplestorySDK,
  SDK,
}


