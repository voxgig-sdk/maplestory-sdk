-- Typed models for the Maplestory SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Android
---@field id? string

---@class AndroidLoadMatch
---@field id? number
---@field region string
---@field version string

---@class Avatar

---@class AvatarLoadMatch
---@field animation string
---@field character_id? string
---@field frame number
---@field bg_color? string
---@field flip_x? boolean
---@field name? string
---@field padding? number
---@field render_mode? number
---@field resize? number
---@field show_ear? boolean
---@field show_high_lef_ear? boolean
---@field show_lef_ear? boolean
---@field format? number
---@field item? string

---@class Cache
---@field evictionCount? number
---@field hitCount? number
---@field hitRatio? number
---@field memoryUsage? number
---@field missCount? number
---@field totalEntries? number

---@class CacheLoadMatch
---@field evictionCount? number
---@field hitCount? number
---@field hitRatio? number
---@field memoryUsage? number
---@field missCount? number
---@field totalEntries? number

---@class Character

---@class CharacterLoadMatch
---@field frame? string
---@field region string
---@field skin_id? number
---@field version string
---@field animation? string
---@field bg_color? string
---@field flip_x? boolean
---@field item? string
---@field name? string
---@field padding? number
---@field render_mode? number
---@field resize? number
---@field show_ear? boolean
---@field show_high_lef_ear? boolean
---@field show_lef_ear? boolean
---@field format? number

---@class Chat

---@class ChatLoadMatch
---@field region string
---@field version string
---@field message? string
---@field ring_ids_joined? string

---@class Cluster
---@field hostname? string
---@field lastSeen? string
---@field metrics? table

---@class ClusterListMatch
---@field hostname? string
---@field lastSeen? string
---@field metrics? table

---@class Diff

---@class DiffLoadMatch
---@field region string
---@field version string

---@class Entity1

---@class Entity1LoadMatch

---@class GmsNew
---@field id? string

---@class GmsNewLoadMatch
---@field type? string

---@class GuildMark

---@class GuildMarkLoadMatch
---@field guild_background_color_id? number
---@field guild_background_id? number
---@field guild_mark_color_id? number
---@field guild_mark_id number
---@field region string
---@field version string
---@field color_id? number

---@class Health

---@class HealthLoadMatch

---@class Item
---@field id? string

---@class ItemLoadMatch
---@field region string
---@field version string
---@field cash_filter? boolean
---@field category_filter? string
---@field count? number
---@field gender_filter? number
---@field job_filter? number
---@field max_level_filter? number
---@field min_level_filter? number
---@field overall_category_filter? string
---@field search_for? string
---@field start_position? number
---@field sub_category_filter? string
---@field id? number
---@field overall_category? string

---@class Job
---@field id? string

---@class JobLoadMatch
---@field id? number
---@field region string
---@field skill_id? number
---@field version string

---@class Map
---@field id? string

---@class MapLoadMatch
---@field frame? number
---@field layer? number
---@field map_id? number
---@field region string
---@field version string
---@field filter_trash? boolean
---@field min_x? number
---@field min_y? number
---@field id? number
---@field show_life? boolean
---@field show_portal? boolean
---@field count? number
---@field search_for? string
---@field start_position? number
---@field map? string
---@field mark_name? string

---@class Metric

---@class MetricLoadMatch

---@class Mob
---@field id? string

---@class MobLoadMatch
---@field region string
---@field version string
---@field count? number
---@field max_level_filter? number
---@field min_level_filter? number
---@field search_for? string
---@field start_position? number
---@field animation? string
---@field id? number
---@field bg_color? string
---@field mob_id? number
---@field frame? number
---@field sound_name? string

---@class Music
---@field id? string

---@class MusicLoadMatch
---@field id string
---@field region string
---@field version string

---@class Name

---@class NameLoadMatch
---@field region string
---@field version string
---@field name? string
---@field ring_ids_joined? string

---@class Npc
---@field id? string

---@class NpcLoadMatch
---@field framebook? string
---@field id? number
---@field region string
---@field version string
---@field animation? string
---@field bg_color? string
---@field npc_id? number
---@field frame? number
---@field count? number
---@field search_for? string
---@field start_at? number

---@class Nxf

---@class NxfLoadMatch

---@class PerformanceMetric
---@field activeRequests? number
---@field averageResponseTimeMs? number
---@field cache? table
---@field errorsByType? table
---@field lastUpdated? string
---@field memoryUsedBytes? number
---@field redisCache? table
---@field requestsPerSecond? number
---@field startTime? string
---@field system? table
---@field totalErrors? number
---@field totalRequests? number
---@field wzPropertiesLoaded? number

---@class PerformanceMetricLoadMatch
---@field activeRequests? number
---@field averageResponseTimeMs? number
---@field cache? table
---@field errorsByType? table
---@field lastUpdated? string
---@field memoryUsedBytes? number
---@field redisCache? table
---@field requestsPerSecond? number
---@field startTime? string
---@field system? table
---@field totalErrors? number
---@field totalRequests? number
---@field wzPropertiesLoaded? number

---@class Pet
---@field id? string

---@class PetLoadMatch
---@field animation? string
---@field pet_id? number
---@field region string
---@field version string
---@field frame? number
---@field pet_equip? number
---@field id? number
---@field render_id? string
---@field bg_color? string

---@class Quest
---@field id? string

---@class QuestLoadMatch
---@field region string
---@field version string
---@field count? number
---@field search_for? string
---@field start_position? number
---@field category? number
---@field id? number

---@class System
---@field cpuUsagePercent? number
---@field gcGen0Collections? number
---@field gcGen1Collections? number
---@field gcGen2Collections? number
---@field threadCount? number
---@field totalMemoryBytes? number
---@field usedMemoryBytes? number

---@class SystemLoadMatch
---@field cpuUsagePercent? number
---@field gcGen0Collections? number
---@field gcGen1Collections? number
---@field gcGen2Collections? number
---@field threadCount? number
---@field totalMemoryBytes? number
---@field usedMemoryBytes? number

---@class Tip

---@class TipLoadMatch
---@field region string
---@field version string

---@class Wzn

---@class WznLoadMatch
---@field path string
---@field region? string
---@field version? string

---@class ZMap

---@class ZMapLoadMatch
---@field region string
---@field version string

local M = {}

return M
