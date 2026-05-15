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



  Android(data?: any) {
    const self = this
    return new AndroidEntity(self,data)
  }


  Avatar(data?: any) {
    const self = this
    return new AvatarEntity(self,data)
  }


  Cache(data?: any) {
    const self = this
    return new CacheEntity(self,data)
  }


  Character(data?: any) {
    const self = this
    return new CharacterEntity(self,data)
  }


  Chat(data?: any) {
    const self = this
    return new ChatEntity(self,data)
  }


  Cluster(data?: any) {
    const self = this
    return new ClusterEntity(self,data)
  }


  Diff(data?: any) {
    const self = this
    return new DiffEntity(self,data)
  }


  Entity1(data?: any) {
    const self = this
    return new Entity1Entity(self,data)
  }


  GmsNew(data?: any) {
    const self = this
    return new GmsNewEntity(self,data)
  }


  GuildMark(data?: any) {
    const self = this
    return new GuildMarkEntity(self,data)
  }


  Health(data?: any) {
    const self = this
    return new HealthEntity(self,data)
  }


  Item(data?: any) {
    const self = this
    return new ItemEntity(self,data)
  }


  Job(data?: any) {
    const self = this
    return new JobEntity(self,data)
  }


  Map(data?: any) {
    const self = this
    return new MapEntity(self,data)
  }


  Metric(data?: any) {
    const self = this
    return new MetricEntity(self,data)
  }


  Mob(data?: any) {
    const self = this
    return new MobEntity(self,data)
  }


  Music(data?: any) {
    const self = this
    return new MusicEntity(self,data)
  }


  Name(data?: any) {
    const self = this
    return new NameEntity(self,data)
  }


  Npc(data?: any) {
    const self = this
    return new NpcEntity(self,data)
  }


  Nxf(data?: any) {
    const self = this
    return new NxfEntity(self,data)
  }


  PerformanceMetric(data?: any) {
    const self = this
    return new PerformanceMetricEntity(self,data)
  }


  Pet(data?: any) {
    const self = this
    return new PetEntity(self,data)
  }


  Quest(data?: any) {
    const self = this
    return new QuestEntity(self,data)
  }


  System(data?: any) {
    const self = this
    return new SystemEntity(self,data)
  }


  Tip(data?: any) {
    const self = this
    return new TipEntity(self,data)
  }


  Wzn(data?: any) {
    const self = this
    return new WznEntity(self,data)
  }


  Wzn2(data?: any) {
    const self = this
    return new Wzn2Entity(self,data)
  }


  Wzn3(data?: any) {
    const self = this
    return new Wzn3Entity(self,data)
  }


  Wzn4(data?: any) {
    const self = this
    return new Wzn4Entity(self,data)
  }


  Wzn5(data?: any) {
    const self = this
    return new Wzn5Entity(self,data)
  }


  Wzn6(data?: any) {
    const self = this
    return new Wzn6Entity(self,data)
  }


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


