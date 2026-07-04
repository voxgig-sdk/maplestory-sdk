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
import { Wzn2Entity } from './entity/Wzn2Entity'
import { Wzn3Entity } from './entity/Wzn3Entity'
import { Wzn4Entity } from './entity/Wzn4Entity'
import { Wzn5Entity } from './entity/Wzn5Entity'
import { Wzn6Entity } from './entity/Wzn6Entity'
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
    const items = struct.items

    if (true === getpath(this._options.feature, 'test.active')) {
      this._mode = 'test'
    }

    this._rootctx.options = this._options

    this._features = []

    const featureAdd = this._utility.featureAdd
    const featureInit = this._utility.featureInit

    items(this._options.feature, (fitem: [string, any]) => {
      const fname = fitem[0]
      const fopts = fitem[1]
      if (fopts.active) {
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    })

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


  async direct(fetchargs?: any) {
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



  // Entity access: `client.Android().list()` / `client.Android().load({ id })`.
  Android(data?: any) {
    const self = this
    return new AndroidEntity(self,data)
  }


  // Entity access: `client.Avatar().list()` / `client.Avatar().load({ id })`.
  Avatar(data?: any) {
    const self = this
    return new AvatarEntity(self,data)
  }


  // Entity access: `client.Cache().list()` / `client.Cache().load({ id })`.
  Cache(data?: any) {
    const self = this
    return new CacheEntity(self,data)
  }


  // Entity access: `client.Character().list()` / `client.Character().load({ id })`.
  Character(data?: any) {
    const self = this
    return new CharacterEntity(self,data)
  }


  // Entity access: `client.Chat().list()` / `client.Chat().load({ id })`.
  Chat(data?: any) {
    const self = this
    return new ChatEntity(self,data)
  }


  // Entity access: `client.Cluster().list()` / `client.Cluster().load({ id })`.
  Cluster(data?: any) {
    const self = this
    return new ClusterEntity(self,data)
  }


  // Entity access: `client.Diff().list()` / `client.Diff().load({ id })`.
  Diff(data?: any) {
    const self = this
    return new DiffEntity(self,data)
  }


  // Entity access: `client.Entity1().list()` / `client.Entity1().load({ id })`.
  Entity1(data?: any) {
    const self = this
    return new Entity1Entity(self,data)
  }


  // Entity access: `client.GmsNew().list()` / `client.GmsNew().load({ id })`.
  GmsNew(data?: any) {
    const self = this
    return new GmsNewEntity(self,data)
  }


  // Entity access: `client.GuildMark().list()` / `client.GuildMark().load({ id })`.
  GuildMark(data?: any) {
    const self = this
    return new GuildMarkEntity(self,data)
  }


  // Entity access: `client.Health().list()` / `client.Health().load({ id })`.
  Health(data?: any) {
    const self = this
    return new HealthEntity(self,data)
  }


  // Entity access: `client.Item().list()` / `client.Item().load({ id })`.
  Item(data?: any) {
    const self = this
    return new ItemEntity(self,data)
  }


  // Entity access: `client.Job().list()` / `client.Job().load({ id })`.
  Job(data?: any) {
    const self = this
    return new JobEntity(self,data)
  }


  // Entity access: `client.Map().list()` / `client.Map().load({ id })`.
  Map(data?: any) {
    const self = this
    return new MapEntity(self,data)
  }


  // Entity access: `client.Metric().list()` / `client.Metric().load({ id })`.
  Metric(data?: any) {
    const self = this
    return new MetricEntity(self,data)
  }


  // Entity access: `client.Mob().list()` / `client.Mob().load({ id })`.
  Mob(data?: any) {
    const self = this
    return new MobEntity(self,data)
  }


  // Entity access: `client.Music().list()` / `client.Music().load({ id })`.
  Music(data?: any) {
    const self = this
    return new MusicEntity(self,data)
  }


  // Entity access: `client.Name().list()` / `client.Name().load({ id })`.
  Name(data?: any) {
    const self = this
    return new NameEntity(self,data)
  }


  // Entity access: `client.Npc().list()` / `client.Npc().load({ id })`.
  Npc(data?: any) {
    const self = this
    return new NpcEntity(self,data)
  }


  // Entity access: `client.Nxf().list()` / `client.Nxf().load({ id })`.
  Nxf(data?: any) {
    const self = this
    return new NxfEntity(self,data)
  }


  // Entity access: `client.PerformanceMetric().list()` / `client.PerformanceMetric().load({ id })`.
  PerformanceMetric(data?: any) {
    const self = this
    return new PerformanceMetricEntity(self,data)
  }


  // Entity access: `client.Pet().list()` / `client.Pet().load({ id })`.
  Pet(data?: any) {
    const self = this
    return new PetEntity(self,data)
  }


  // Entity access: `client.Quest().list()` / `client.Quest().load({ id })`.
  Quest(data?: any) {
    const self = this
    return new QuestEntity(self,data)
  }


  // Entity access: `client.System().list()` / `client.System().load({ id })`.
  System(data?: any) {
    const self = this
    return new SystemEntity(self,data)
  }


  // Entity access: `client.Tip().list()` / `client.Tip().load({ id })`.
  Tip(data?: any) {
    const self = this
    return new TipEntity(self,data)
  }


  // Entity access: `client.Wzn().list()` / `client.Wzn().load({ id })`.
  Wzn(data?: any) {
    const self = this
    return new WznEntity(self,data)
  }


  // Entity access: `client.Wzn2().list()` / `client.Wzn2().load({ id })`.
  Wzn2(data?: any) {
    const self = this
    return new Wzn2Entity(self,data)
  }


  // Entity access: `client.Wzn3().list()` / `client.Wzn3().load({ id })`.
  Wzn3(data?: any) {
    const self = this
    return new Wzn3Entity(self,data)
  }


  // Entity access: `client.Wzn4().list()` / `client.Wzn4().load({ id })`.
  Wzn4(data?: any) {
    const self = this
    return new Wzn4Entity(self,data)
  }


  // Entity access: `client.Wzn5().list()` / `client.Wzn5().load({ id })`.
  Wzn5(data?: any) {
    const self = this
    return new Wzn5Entity(self,data)
  }


  // Entity access: `client.Wzn6().list()` / `client.Wzn6().load({ id })`.
  Wzn6(data?: any) {
    const self = this
    return new Wzn6Entity(self,data)
  }


  // Entity access: `client.ZMap().list()` / `client.ZMap().load({ id })`.
  ZMap(data?: any) {
    const self = this
    return new ZMapEntity(self,data)
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

  BaseFeature,
  MaplestoryEntityBase,

  MaplestorySDK,
  SDK,
}


