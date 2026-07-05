// Typed models for the Maplestory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Android {
}

export interface AndroidLoadMatch {
  id: number
  region: string
  version: string
}

export interface Avatar {
}

export interface AvatarLoadMatch {
  animation: string
  character_id: string
  frame: number
  item: string
}

export interface Cache {
  eviction_count?: number
  hit_count?: number
  hit_ratio?: number
  memory_usage?: number
  miss_count?: number
  total_entry?: number
}

export interface CacheLoadMatch {
  eviction_count?: number
  hit_count?: number
  hit_ratio?: number
  memory_usage?: number
  miss_count?: number
  total_entry?: number
}

export interface Character {
}

export interface CharacterLoadMatch {
  frame: string
  region: string
  skin_id: number
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
  last_seen?: string
  metric?: Record<string, any>
}

export interface ClusterListMatch {
  hostname?: string
  last_seen?: string
  metric?: Record<string, any>
}

export interface Diff {
}

export interface DiffLoadMatch {
  region: string
  version: string
}

export interface Entity1 {
}

export interface Entity1LoadMatch {
}

export interface GmsNew {
}

export interface GmsNewLoadMatch {
  id: number
}

export interface GuildMark {
}

export interface GuildMarkLoadMatch {
  guild_background_color_id: number
  guild_background_id: number
  guild_mark_color_id: number
  guild_mark_id: number
  region: string
  version: string
  color_id: number
}

export interface Health {
}

export interface HealthLoadMatch {
}

export interface Item {
}

export interface ItemLoadMatch {
  region: string
  version: string
  id: number
  overall_category: string
}

export interface Job {
}

export interface JobLoadMatch {
  id: number
  region: string
  skill_id: number
  version: string
}

export interface Map {
}

export interface MapLoadMatch {
  frame: number
  layer: number
  map_id: number
  region: string
  version: string
  id: number
  map: string
  mark_name: string
}

export interface Metric {
}

export interface MetricLoadMatch {
}

export interface Mob {
}

export interface MobLoadMatch {
  region: string
  version: string
  animation: string
  id: number
  mob_id: number
  frame: number
  sound_name: string
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
  framebook: string
  id: number
  region: string
  version: string
  npc_id: number
}

export interface Nxf {
}

export interface NxfLoadMatch {
}

export interface PerformanceMetric {
  active_request?: number
  average_response_time_m?: number
  cache?: Record<string, any>
  errors_by_type?: Record<string, any>
  last_updated?: string
  memory_used_byte?: number
  redis_cache?: Record<string, any>
  requests_per_second?: number
  start_time?: string
  system?: Record<string, any>
  total_error?: number
  total_request?: number
  wz_properties_loaded?: number
}

export interface PerformanceMetricLoadMatch {
  active_request?: number
  average_response_time_m?: number
  cache?: Record<string, any>
  errors_by_type?: Record<string, any>
  last_updated?: string
  memory_used_byte?: number
  redis_cache?: Record<string, any>
  requests_per_second?: number
  start_time?: string
  system?: Record<string, any>
  total_error?: number
  total_request?: number
  wz_properties_loaded?: number
}

export interface Pet {
}

export interface PetLoadMatch {
  animation: string
  pet_id: number
  region: string
  version: string
  id: number
  render_id: string
}

export interface Quest {
}

export interface QuestLoadMatch {
  region: string
  version: string
  category: number
  id: number
}

export interface System {
  cpu_usage_percent?: number
  gc_gen0_collection?: number
  gc_gen1_collection?: number
  gc_gen2_collection?: number
  thread_count?: number
  total_memory_byte?: number
  used_memory_byte?: number
}

export interface SystemLoadMatch {
  cpu_usage_percent?: number
  gc_gen0_collection?: number
  gc_gen1_collection?: number
  gc_gen2_collection?: number
  thread_count?: number
  total_memory_byte?: number
  used_memory_byte?: number
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
  region: string
  version: string
}

export interface Wzn2 {
}

export interface Wzn2LoadMatch {
  path: string
  region: string
  version: string
}

export interface Wzn3 {
}

export interface Wzn3LoadMatch {
  path: string
  region: string
  version: string
}

export interface Wzn4 {
}

export interface Wzn4LoadMatch {
  path: string
  region: string
  version: string
}

export interface Wzn5 {
}

export interface Wzn5LoadMatch {
  path: string
  region: string
  version: string
}

export interface Wzn6 {
}

export interface Wzn6LoadMatch {
  path: string
  region: string
  version: string
}

export interface ZMap {
}

export interface ZMapLoadMatch {
  region: string
  version: string
}

