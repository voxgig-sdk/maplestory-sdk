// Typed models for the Maplestory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Android {
}

export interface AndroidLoadMatch {
  id?: number
  region: string
  version: string
}

export interface Avatar {
}

export interface AvatarLoadMatch {
  animation: string
  character_id?: string
  frame: number
  item?: string
}

export interface Cache {
  evictionCount?: number
  hitCount?: number
  hitRatio?: number
  memoryUsage?: number
  missCount?: number
  totalEntries?: number
}

export interface CacheLoadMatch {
  evictionCount?: number
  hitCount?: number
  hitRatio?: number
  memoryUsage?: number
  missCount?: number
  totalEntries?: number
}

export interface Character {
}

export interface CharacterLoadMatch {
  frame?: string
  region: string
  skin_id?: number
  version: string
}

export interface Chat {
}

export interface ChatLoadMatch {
  region: string
  version: string
}

export interface Cluster {
  hostname?: string
  lastSeen?: string
  metrics?: Record<string, any>
}

export interface ClusterListMatch {
  hostname?: string
  lastSeen?: string
  metrics?: Record<string, any>
}

export interface Diff {
}

export interface DiffLoadMatch {
  region: string
  version: string

  // Selects a custom action instead of the plain load:
  //   'grouped'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Entity1 {
}

export interface Entity1LoadMatch {
}

export interface GmsNew {
}

export interface GmsNewLoadMatch {
  id?: number
}

export interface GuildMark {
}

export interface GuildMarkLoadMatch {
  guild_background_color_id?: number
  guild_background_id?: number
  guild_mark_color_id?: number
  guild_mark_id: number
  region: string
  version: string
  color_id?: number
}

export interface Health {
}

export interface HealthLoadMatch {

  // Selects a custom action instead of the plain load:
  //   'alive' | 'ready' | 'start'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Item {
}

export interface ItemLoadMatch {
  region: string
  version: string
  id?: number
  overall_category?: string

  // Selects a custom action instead of the plain load:
  //   'category' | 'count' | 'icon' | 'icon_raw' | 'list' | 'name'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Job {
}

export interface JobLoadMatch {
  id?: number
  region: string
  skill_id?: number
  version: string

  // Selects a custom action instead of the plain load:
  //   'count' | 'skillbook' | 'skilltree'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Map {
}

export interface MapLoadMatch {
  frame?: number
  layer?: number
  map_id?: number
  region: string
  version: string
  id?: number
  map?: string
  mark_name?: string

  // Selects a custom action instead of the plain load:
  //   'bgm' | 'count' | 'icon' | 'minimap' | 'name' | 'worldmap'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Metric {
}

export interface MetricLoadMatch {

  // Selects a custom action instead of the plain load:
  //   'health'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Mob {
}

export interface MobLoadMatch {
  region: string
  version: string
  animation?: string
  id?: number
  mob_id?: number
  frame?: number
  sound_name?: string

  // Selects a custom action instead of the plain load:
  //   'count' | 'download' | 'icon' | 'name' | 'sound'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Music {
}

export interface MusicLoadMatch {
  id: string
  region: string
  version: string
}

export interface Name {
}

export interface NameLoadMatch {
  region: string
  version: string
}

export interface Npc {
}

export interface NpcLoadMatch {
  framebook?: string
  id?: number
  region: string
  version: string
  npc_id?: number

  // Selects a custom action instead of the plain load:
  //   'count' | 'download' | 'icon' | 'name'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Nxf {
}

export interface NxfLoadMatch {
}

export interface PerformanceMetric {
  activeRequests?: number
  averageResponseTimeMs?: number
  cache?: Record<string, any>
  errorsByType?: Record<string, any>
  lastUpdated?: string
  memoryUsedBytes?: number
  redisCache?: Record<string, any>
  requestsPerSecond?: number
  startTime?: string
  system?: Record<string, any>
  totalErrors?: number
  totalRequests?: number
  wzPropertiesLoaded?: number
}

export interface PerformanceMetricLoadMatch {
  activeRequests?: number
  averageResponseTimeMs?: number
  cache?: Record<string, any>
  errorsByType?: Record<string, any>
  lastUpdated?: string
  memoryUsedBytes?: number
  redisCache?: Record<string, any>
  requestsPerSecond?: number
  startTime?: string
  system?: Record<string, any>
  totalErrors?: number
  totalRequests?: number
  wzPropertiesLoaded?: number
}

export interface Pet {
}

export interface PetLoadMatch {
  animation?: string
  pet_id?: number
  region: string
  version: string
  id?: number
  render_id?: string

  // Selects a custom action instead of the plain load:
  //   'action' | 'count' | 'download' | 'name'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Quest {
}

export interface QuestLoadMatch {
  region: string
  version: string
  category?: number
  id?: number

  // Selects a custom action instead of the plain load:
  //   'category' | 'count' | 'icon' | 'name'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface System {
  cpuUsagePercent?: number
  gcGen0Collections?: number
  gcGen1Collections?: number
  gcGen2Collections?: number
  threadCount?: number
  totalMemoryBytes?: number
  usedMemoryBytes?: number
}

export interface SystemLoadMatch {
  cpuUsagePercent?: number
  gcGen0Collections?: number
  gcGen1Collections?: number
  gcGen2Collections?: number
  threadCount?: number
  totalMemoryBytes?: number
  usedMemoryBytes?: number
}

export interface Tip {
}

export interface TipLoadMatch {
  region: string
  version: string
}

export interface Wzn {
}

export interface WznLoadMatch {
  path?: string
  region: string
  version: string
}

export interface ZMap {
}

export interface ZMapLoadMatch {
  region: string
  version: string
}

