// Typed models for the Maplestory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Android {
  id?: string
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
  bg_color?: string
  flip_x?: boolean
  name?: string
  padding?: number
  render_mode?: number
  resize?: number
  show_ear?: boolean
  show_high_lef_ear?: boolean
  show_lef_ear?: boolean
  format?: number
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
  animation?: string
  bg_color?: string
  flip_x?: boolean
  item?: string
  name?: string
  padding?: number
  render_mode?: number
  resize?: number
  show_ear?: boolean
  show_high_lef_ear?: boolean
  show_lef_ear?: boolean
  format?: number
}

export interface Chat {
}

export interface ChatLoadMatch {
  region: string
  version: string
  message?: string
  ring_ids_joined?: string
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
  id?: string
}

export interface GmsNewLoadMatch {
  type?: string
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
  id?: string
}

export interface ItemLoadMatch {
  region: string
  version: string
  cash_filter?: boolean
  category_filter?: string
  count?: number
  gender_filter?: number
  job_filter?: number
  max_level_filter?: number
  min_level_filter?: number
  overall_category_filter?: string
  search_for?: string
  start_position?: number
  sub_category_filter?: string
  id?: number
  overall_category?: string

  // Selects a custom action instead of the plain load:
  //   'category' | 'count' | 'icon' | 'icon_raw' | 'list' | 'name'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Job {
  id?: string
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

export interface MapType {
  id?: string
}

export interface MapLoadMatch {
  frame?: number
  layer?: number
  map_id?: number
  region: string
  version: string
  filter_trash?: boolean
  min_x?: number
  min_y?: number
  id?: number
  show_life?: boolean
  show_portal?: boolean
  count?: number
  search_for?: string
  start_position?: number
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
  id?: string
}

export interface MobLoadMatch {
  region: string
  version: string
  count?: number
  max_level_filter?: number
  min_level_filter?: number
  search_for?: string
  start_position?: number
  animation?: string
  id?: number
  bg_color?: string
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
  id?: string
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
  name?: string
  ring_ids_joined?: string
}

export interface Npc {
  id?: string
}

export interface NpcLoadMatch {
  framebook?: string
  id?: number
  region: string
  version: string
  animation?: string
  bg_color?: string
  npc_id?: number
  frame?: number
  count?: number
  search_for?: string
  start_at?: number

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
  id?: string
}

export interface PetLoadMatch {
  animation?: string
  pet_id?: number
  region: string
  version: string
  frame?: number
  pet_equip?: number
  id?: number
  render_id?: string
  bg_color?: string

  // Selects a custom action instead of the plain load:
  //   'action' | 'count' | 'download' | 'name'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface Quest {
  id?: string
}

export interface QuestLoadMatch {
  region: string
  version: string
  count?: number
  search_for?: string
  start_position?: number
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
  path: string
  region?: string
  version?: string
}

export interface ZMap {
}

export interface ZMapLoadMatch {
  region: string
  version: string
}

