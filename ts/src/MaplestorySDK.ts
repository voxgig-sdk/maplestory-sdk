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



  _android?: AndroidEntity

  // Idiomatic facade: `client.android.list()` / `client.android.load({ id })`.
  get android(): AndroidEntity {
    return (this._android ??= new AndroidEntity(this, undefined))
  }

  /** @deprecated Use `client.android` instead. */
  Android(data?: any) {
    const self = this
    return new AndroidEntity(self,data)
  }


  _avatar?: AvatarEntity

  // Idiomatic facade: `client.avatar.list()` / `client.avatar.load({ id })`.
  get avatar(): AvatarEntity {
    return (this._avatar ??= new AvatarEntity(this, undefined))
  }

  /** @deprecated Use `client.avatar` instead. */
  Avatar(data?: any) {
    const self = this
    return new AvatarEntity(self,data)
  }


  _cache?: CacheEntity

  // Idiomatic facade: `client.cache.list()` / `client.cache.load({ id })`.
  get cache(): CacheEntity {
    return (this._cache ??= new CacheEntity(this, undefined))
  }

  /** @deprecated Use `client.cache` instead. */
  Cache(data?: any) {
    const self = this
    return new CacheEntity(self,data)
  }


  _character?: CharacterEntity

  // Idiomatic facade: `client.character.list()` / `client.character.load({ id })`.
  get character(): CharacterEntity {
    return (this._character ??= new CharacterEntity(this, undefined))
  }

  /** @deprecated Use `client.character` instead. */
  Character(data?: any) {
    const self = this
    return new CharacterEntity(self,data)
  }


  _chat?: ChatEntity

  // Idiomatic facade: `client.chat.list()` / `client.chat.load({ id })`.
  get chat(): ChatEntity {
    return (this._chat ??= new ChatEntity(this, undefined))
  }

  /** @deprecated Use `client.chat` instead. */
  Chat(data?: any) {
    const self = this
    return new ChatEntity(self,data)
  }


  _cluster?: ClusterEntity

  // Idiomatic facade: `client.cluster.list()` / `client.cluster.load({ id })`.
  get cluster(): ClusterEntity {
    return (this._cluster ??= new ClusterEntity(this, undefined))
  }

  /** @deprecated Use `client.cluster` instead. */
  Cluster(data?: any) {
    const self = this
    return new ClusterEntity(self,data)
  }


  _diff?: DiffEntity

  // Idiomatic facade: `client.diff.list()` / `client.diff.load({ id })`.
  get diff(): DiffEntity {
    return (this._diff ??= new DiffEntity(this, undefined))
  }

  /** @deprecated Use `client.diff` instead. */
  Diff(data?: any) {
    const self = this
    return new DiffEntity(self,data)
  }


  _entity1?: Entity1Entity

  // Idiomatic facade: `client.entity1.list()` / `client.entity1.load({ id })`.
  get entity1(): Entity1Entity {
    return (this._entity1 ??= new Entity1Entity(this, undefined))
  }

  /** @deprecated Use `client.entity1` instead. */
  Entity1(data?: any) {
    const self = this
    return new Entity1Entity(self,data)
  }


  _gms_new?: GmsNewEntity

  // Idiomatic facade: `client.gms_new.list()` / `client.gms_new.load({ id })`.
  get gms_new(): GmsNewEntity {
    return (this._gms_new ??= new GmsNewEntity(this, undefined))
  }

  /** @deprecated Use `client.gms_new` instead. */
  GmsNew(data?: any) {
    const self = this
    return new GmsNewEntity(self,data)
  }


  _guild_mark?: GuildMarkEntity

  // Idiomatic facade: `client.guild_mark.list()` / `client.guild_mark.load({ id })`.
  get guild_mark(): GuildMarkEntity {
    return (this._guild_mark ??= new GuildMarkEntity(this, undefined))
  }

  /** @deprecated Use `client.guild_mark` instead. */
  GuildMark(data?: any) {
    const self = this
    return new GuildMarkEntity(self,data)
  }


  _health?: HealthEntity

  // Idiomatic facade: `client.health.list()` / `client.health.load({ id })`.
  get health(): HealthEntity {
    return (this._health ??= new HealthEntity(this, undefined))
  }

  /** @deprecated Use `client.health` instead. */
  Health(data?: any) {
    const self = this
    return new HealthEntity(self,data)
  }


  _item?: ItemEntity

  // Idiomatic facade: `client.item.list()` / `client.item.load({ id })`.
  get item(): ItemEntity {
    return (this._item ??= new ItemEntity(this, undefined))
  }

  /** @deprecated Use `client.item` instead. */
  Item(data?: any) {
    const self = this
    return new ItemEntity(self,data)
  }


  _job?: JobEntity

  // Idiomatic facade: `client.job.list()` / `client.job.load({ id })`.
  get job(): JobEntity {
    return (this._job ??= new JobEntity(this, undefined))
  }

  /** @deprecated Use `client.job` instead. */
  Job(data?: any) {
    const self = this
    return new JobEntity(self,data)
  }


  _map?: MapEntity

  // Idiomatic facade: `client.map.list()` / `client.map.load({ id })`.
  get map(): MapEntity {
    return (this._map ??= new MapEntity(this, undefined))
  }

  /** @deprecated Use `client.map` instead. */
  Map(data?: any) {
    const self = this
    return new MapEntity(self,data)
  }


  _metric?: MetricEntity

  // Idiomatic facade: `client.metric.list()` / `client.metric.load({ id })`.
  get metric(): MetricEntity {
    return (this._metric ??= new MetricEntity(this, undefined))
  }

  /** @deprecated Use `client.metric` instead. */
  Metric(data?: any) {
    const self = this
    return new MetricEntity(self,data)
  }


  _mob?: MobEntity

  // Idiomatic facade: `client.mob.list()` / `client.mob.load({ id })`.
  get mob(): MobEntity {
    return (this._mob ??= new MobEntity(this, undefined))
  }

  /** @deprecated Use `client.mob` instead. */
  Mob(data?: any) {
    const self = this
    return new MobEntity(self,data)
  }


  _music?: MusicEntity

  // Idiomatic facade: `client.music.list()` / `client.music.load({ id })`.
  get music(): MusicEntity {
    return (this._music ??= new MusicEntity(this, undefined))
  }

  /** @deprecated Use `client.music` instead. */
  Music(data?: any) {
    const self = this
    return new MusicEntity(self,data)
  }


  _name?: NameEntity

  // Idiomatic facade: `client.name.list()` / `client.name.load({ id })`.
  get name(): NameEntity {
    return (this._name ??= new NameEntity(this, undefined))
  }

  /** @deprecated Use `client.name` instead. */
  Name(data?: any) {
    const self = this
    return new NameEntity(self,data)
  }


  _npc?: NpcEntity

  // Idiomatic facade: `client.npc.list()` / `client.npc.load({ id })`.
  get npc(): NpcEntity {
    return (this._npc ??= new NpcEntity(this, undefined))
  }

  /** @deprecated Use `client.npc` instead. */
  Npc(data?: any) {
    const self = this
    return new NpcEntity(self,data)
  }


  _nxf?: NxfEntity

  // Idiomatic facade: `client.nxf.list()` / `client.nxf.load({ id })`.
  get nxf(): NxfEntity {
    return (this._nxf ??= new NxfEntity(this, undefined))
  }

  /** @deprecated Use `client.nxf` instead. */
  Nxf(data?: any) {
    const self = this
    return new NxfEntity(self,data)
  }


  _performance_metric?: PerformanceMetricEntity

  // Idiomatic facade: `client.performance_metric.list()` / `client.performance_metric.load({ id })`.
  get performance_metric(): PerformanceMetricEntity {
    return (this._performance_metric ??= new PerformanceMetricEntity(this, undefined))
  }

  /** @deprecated Use `client.performance_metric` instead. */
  PerformanceMetric(data?: any) {
    const self = this
    return new PerformanceMetricEntity(self,data)
  }


  _pet?: PetEntity

  // Idiomatic facade: `client.pet.list()` / `client.pet.load({ id })`.
  get pet(): PetEntity {
    return (this._pet ??= new PetEntity(this, undefined))
  }

  /** @deprecated Use `client.pet` instead. */
  Pet(data?: any) {
    const self = this
    return new PetEntity(self,data)
  }


  _quest?: QuestEntity

  // Idiomatic facade: `client.quest.list()` / `client.quest.load({ id })`.
  get quest(): QuestEntity {
    return (this._quest ??= new QuestEntity(this, undefined))
  }

  /** @deprecated Use `client.quest` instead. */
  Quest(data?: any) {
    const self = this
    return new QuestEntity(self,data)
  }


  _system?: SystemEntity

  // Idiomatic facade: `client.system.list()` / `client.system.load({ id })`.
  get system(): SystemEntity {
    return (this._system ??= new SystemEntity(this, undefined))
  }

  /** @deprecated Use `client.system` instead. */
  System(data?: any) {
    const self = this
    return new SystemEntity(self,data)
  }


  _tip?: TipEntity

  // Idiomatic facade: `client.tip.list()` / `client.tip.load({ id })`.
  get tip(): TipEntity {
    return (this._tip ??= new TipEntity(this, undefined))
  }

  /** @deprecated Use `client.tip` instead. */
  Tip(data?: any) {
    const self = this
    return new TipEntity(self,data)
  }


  _wzn?: WznEntity

  // Idiomatic facade: `client.wzn.list()` / `client.wzn.load({ id })`.
  get wzn(): WznEntity {
    return (this._wzn ??= new WznEntity(this, undefined))
  }

  /** @deprecated Use `client.wzn` instead. */
  Wzn(data?: any) {
    const self = this
    return new WznEntity(self,data)
  }


  _wzn2?: Wzn2Entity

  // Idiomatic facade: `client.wzn2.list()` / `client.wzn2.load({ id })`.
  get wzn2(): Wzn2Entity {
    return (this._wzn2 ??= new Wzn2Entity(this, undefined))
  }

  /** @deprecated Use `client.wzn2` instead. */
  Wzn2(data?: any) {
    const self = this
    return new Wzn2Entity(self,data)
  }


  _wzn3?: Wzn3Entity

  // Idiomatic facade: `client.wzn3.list()` / `client.wzn3.load({ id })`.
  get wzn3(): Wzn3Entity {
    return (this._wzn3 ??= new Wzn3Entity(this, undefined))
  }

  /** @deprecated Use `client.wzn3` instead. */
  Wzn3(data?: any) {
    const self = this
    return new Wzn3Entity(self,data)
  }


  _wzn4?: Wzn4Entity

  // Idiomatic facade: `client.wzn4.list()` / `client.wzn4.load({ id })`.
  get wzn4(): Wzn4Entity {
    return (this._wzn4 ??= new Wzn4Entity(this, undefined))
  }

  /** @deprecated Use `client.wzn4` instead. */
  Wzn4(data?: any) {
    const self = this
    return new Wzn4Entity(self,data)
  }


  _wzn5?: Wzn5Entity

  // Idiomatic facade: `client.wzn5.list()` / `client.wzn5.load({ id })`.
  get wzn5(): Wzn5Entity {
    return (this._wzn5 ??= new Wzn5Entity(this, undefined))
  }

  /** @deprecated Use `client.wzn5` instead. */
  Wzn5(data?: any) {
    const self = this
    return new Wzn5Entity(self,data)
  }


  _wzn6?: Wzn6Entity

  // Idiomatic facade: `client.wzn6.list()` / `client.wzn6.load({ id })`.
  get wzn6(): Wzn6Entity {
    return (this._wzn6 ??= new Wzn6Entity(this, undefined))
  }

  /** @deprecated Use `client.wzn6` instead. */
  Wzn6(data?: any) {
    const self = this
    return new Wzn6Entity(self,data)
  }


  _z_map?: ZMapEntity

  // Idiomatic facade: `client.z_map.list()` / `client.z_map.load({ id })`.
  get z_map(): ZMapEntity {
    return (this._z_map ??= new ZMapEntity(this, undefined))
  }

  /** @deprecated Use `client.z_map` instead. */
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


