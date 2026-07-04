-- Typed models for the Maplestory SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Android

---@class AndroidLoadMatch
---@field id number
---@field region string
---@field version string

---@class Avatar

---@class AvatarLoadMatch
---@field animation string
---@field character_id string
---@field frame number
---@field item string

---@class Cache
---@field eviction_count? number
---@field hit_count? number
---@field hit_ratio? number
---@field memory_usage? number
---@field miss_count? number
---@field total_entry? number

---@class CacheLoadMatch

---@class Character

---@class CharacterLoadMatch
---@field frame string
---@field region string
---@field skin_id number
---@field version string

---@class Chat

---@class ChatLoadMatch
---@field region string
---@field version string

---@class Cluster
---@field hostname? string
---@field last_seen? string
---@field metric? table

---@class ClusterListMatch

---@class Diff

---@class DiffLoadMatch
---@field region string
---@field version string

---@class Entity1

---@class Entity1LoadMatch

---@class GmsNew

---@class GmsNewLoadMatch
---@field id number

---@class GuildMark

---@class GuildMarkLoadMatch
---@field guild_background_color_id number
---@field guild_background_id number
---@field guild_mark_color_id number
---@field guild_mark_id number
---@field region string
---@field version string
---@field color_id number

---@class Health

---@class HealthLoadMatch

---@class Item

---@class ItemLoadMatch
---@field region string
---@field version string
---@field id number
---@field overall_category string

---@class Job

---@class JobLoadMatch
---@field id number
---@field region string
---@field skill_id number
---@field version string

---@class Map

---@class MapLoadMatch
---@field frame number
---@field layer number
---@field map_id number
---@field region string
---@field version string
---@field id number
---@field map string
---@field mark_name string

---@class Metric

---@class MetricLoadMatch

---@class Mob

---@class MobLoadMatch
---@field region string
---@field version string
---@field animation string
---@field id number
---@field mob_id number
---@field frame number
---@field sound_name string

---@class Music

---@class MusicLoadMatch
---@field id string
---@field region string
---@field version string

---@class Name

---@class NameLoadMatch
---@field region string
---@field version string

---@class Npc

---@class NpcLoadMatch
---@field framebook string
---@field id number
---@field region string
---@field version string
---@field npc_id number

---@class Nxf

---@class NxfLoadMatch

---@class PerformanceMetric
---@field active_request? number
---@field average_response_time_m? number
---@field cache? table
---@field errors_by_type? table
---@field last_updated? string
---@field memory_used_byte? number
---@field redis_cache? table
---@field requests_per_second? number
---@field start_time? string
---@field system? table
---@field total_error? number
---@field total_request? number
---@field wz_properties_loaded? number

---@class PerformanceMetricLoadMatch

---@class Pet

---@class PetLoadMatch
---@field animation string
---@field pet_id number
---@field region string
---@field version string
---@field id number
---@field render_id string

---@class Quest

---@class QuestLoadMatch
---@field region string
---@field version string
---@field category number
---@field id number

---@class System
---@field cpu_usage_percent? number
---@field gc_gen0_collection? number
---@field gc_gen1_collection? number
---@field gc_gen2_collection? number
---@field thread_count? number
---@field total_memory_byte? number
---@field used_memory_byte? number

---@class SystemLoadMatch

---@class Tip

---@class TipLoadMatch
---@field region string
---@field version string

---@class Wzn

---@class WznLoadMatch
---@field region string
---@field version string

---@class Wzn2

---@class Wzn2LoadMatch
---@field path string
---@field region string
---@field version string

---@class Wzn3

---@class Wzn3LoadMatch
---@field path string
---@field region string
---@field version string

---@class Wzn4

---@class Wzn4LoadMatch
---@field path string
---@field region string
---@field version string

---@class Wzn5

---@class Wzn5LoadMatch
---@field path string
---@field region string
---@field version string

---@class Wzn6

---@class Wzn6LoadMatch
---@field path string
---@field region string
---@field version string

---@class ZMap

---@class ZMapLoadMatch
---@field region string
---@field version string

local M = {}

return M
