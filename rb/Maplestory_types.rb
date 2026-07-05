# frozen_string_literal: true

# Typed models for the Maplestory SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Android entity data model.
class Android
end

# Request payload for Android#load.
#
# @!attribute [rw] id
#   @return [Integer]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
AndroidLoadMatch = Struct.new(
  :id,
  :region,
  :version,
  keyword_init: true
)

# Avatar entity data model.
class Avatar
end

# Request payload for Avatar#load.
#
# @!attribute [rw] animation
#   @return [String]
#
# @!attribute [rw] character_id
#   @return [String]
#
# @!attribute [rw] frame
#   @return [Integer]
#
# @!attribute [rw] item
#   @return [String]
AvatarLoadMatch = Struct.new(
  :animation,
  :character_id,
  :frame,
  :item,
  keyword_init: true
)

# Cache entity data model.
#
# @!attribute [rw] eviction_count
#   @return [Integer, nil]
#
# @!attribute [rw] hit_count
#   @return [Integer, nil]
#
# @!attribute [rw] hit_ratio
#   @return [Float, nil]
#
# @!attribute [rw] memory_usage
#   @return [Integer, nil]
#
# @!attribute [rw] miss_count
#   @return [Integer, nil]
#
# @!attribute [rw] total_entry
#   @return [Integer, nil]
Cache = Struct.new(
  :eviction_count,
  :hit_count,
  :hit_ratio,
  :memory_usage,
  :miss_count,
  :total_entry,
  keyword_init: true
)

# Request payload for Cache#load.
#
# @!attribute [rw] eviction_count
#   @return [Integer, nil]
#
# @!attribute [rw] hit_count
#   @return [Integer, nil]
#
# @!attribute [rw] hit_ratio
#   @return [Float, nil]
#
# @!attribute [rw] memory_usage
#   @return [Integer, nil]
#
# @!attribute [rw] miss_count
#   @return [Integer, nil]
#
# @!attribute [rw] total_entry
#   @return [Integer, nil]
CacheLoadMatch = Struct.new(
  :eviction_count,
  :hit_count,
  :hit_ratio,
  :memory_usage,
  :miss_count,
  :total_entry,
  keyword_init: true
)

# Character entity data model.
class Character
end

# Request payload for Character#load.
#
# @!attribute [rw] frame
#   @return [String]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] skin_id
#   @return [Integer]
#
# @!attribute [rw] version
#   @return [String]
CharacterLoadMatch = Struct.new(
  :frame,
  :region,
  :skin_id,
  :version,
  keyword_init: true
)

# Chat entity data model.
class Chat
end

# Request payload for Chat#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
ChatLoadMatch = Struct.new(
  :region,
  :version,
  keyword_init: true
)

# Cluster entity data model.
#
# @!attribute [rw] hostname
#   @return [String, nil]
#
# @!attribute [rw] last_seen
#   @return [String, nil]
#
# @!attribute [rw] metric
#   @return [Hash, nil]
Cluster = Struct.new(
  :hostname,
  :last_seen,
  :metric,
  keyword_init: true
)

# Request payload for Cluster#list.
#
# @!attribute [rw] hostname
#   @return [String, nil]
#
# @!attribute [rw] last_seen
#   @return [String, nil]
#
# @!attribute [rw] metric
#   @return [Hash, nil]
ClusterListMatch = Struct.new(
  :hostname,
  :last_seen,
  :metric,
  keyword_init: true
)

# Diff entity data model.
class Diff
end

# Request payload for Diff#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
DiffLoadMatch = Struct.new(
  :region,
  :version,
  keyword_init: true
)

# Entity1 entity data model.
class Entity1
end

# Request payload for Entity1#load.
class Entity1LoadMatch
end

# GmsNew entity data model.
class GmsNew
end

# Request payload for GmsNew#load.
#
# @!attribute [rw] id
#   @return [Integer]
GmsNewLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# GuildMark entity data model.
class GuildMark
end

# Request payload for GuildMark#load.
#
# @!attribute [rw] guild_background_color_id
#   @return [Integer]
#
# @!attribute [rw] guild_background_id
#   @return [Integer]
#
# @!attribute [rw] guild_mark_color_id
#   @return [Integer]
#
# @!attribute [rw] guild_mark_id
#   @return [Integer]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] color_id
#   @return [Integer]
GuildMarkLoadMatch = Struct.new(
  :guild_background_color_id,
  :guild_background_id,
  :guild_mark_color_id,
  :guild_mark_id,
  :region,
  :version,
  :color_id,
  keyword_init: true
)

# Health entity data model.
class Health
end

# Request payload for Health#load.
class HealthLoadMatch
end

# Item entity data model.
class Item
end

# Request payload for Item#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer]
#
# @!attribute [rw] overall_category
#   @return [String]
ItemLoadMatch = Struct.new(
  :region,
  :version,
  :id,
  :overall_category,
  keyword_init: true
)

# Job entity data model.
class Job
end

# Request payload for Job#load.
#
# @!attribute [rw] id
#   @return [Integer]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] skill_id
#   @return [Integer]
#
# @!attribute [rw] version
#   @return [String]
JobLoadMatch = Struct.new(
  :id,
  :region,
  :skill_id,
  :version,
  keyword_init: true
)

# Map entity data model.
class Map
end

# Request payload for Map#load.
#
# @!attribute [rw] frame
#   @return [Integer]
#
# @!attribute [rw] layer
#   @return [Integer]
#
# @!attribute [rw] map_id
#   @return [Integer]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer]
#
# @!attribute [rw] map
#   @return [String]
#
# @!attribute [rw] mark_name
#   @return [String]
MapLoadMatch = Struct.new(
  :frame,
  :layer,
  :map_id,
  :region,
  :version,
  :id,
  :map,
  :mark_name,
  keyword_init: true
)

# Metric entity data model.
class Metric
end

# Request payload for Metric#load.
class MetricLoadMatch
end

# Mob entity data model.
class Mob
end

# Request payload for Mob#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] animation
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer]
#
# @!attribute [rw] mob_id
#   @return [Integer]
#
# @!attribute [rw] frame
#   @return [Integer]
#
# @!attribute [rw] sound_name
#   @return [String]
MobLoadMatch = Struct.new(
  :region,
  :version,
  :animation,
  :id,
  :mob_id,
  :frame,
  :sound_name,
  keyword_init: true
)

# Music entity data model.
class Music
end

# Request payload for Music#load.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
MusicLoadMatch = Struct.new(
  :id,
  :region,
  :version,
  keyword_init: true
)

# Name entity data model.
class Name
end

# Request payload for Name#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
NameLoadMatch = Struct.new(
  :region,
  :version,
  keyword_init: true
)

# Npc entity data model.
class Npc
end

# Request payload for Npc#load.
#
# @!attribute [rw] framebook
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] npc_id
#   @return [Integer]
NpcLoadMatch = Struct.new(
  :framebook,
  :id,
  :region,
  :version,
  :npc_id,
  keyword_init: true
)

# Nxf entity data model.
class Nxf
end

# Request payload for Nxf#load.
class NxfLoadMatch
end

# PerformanceMetric entity data model.
#
# @!attribute [rw] active_request
#   @return [Integer, nil]
#
# @!attribute [rw] average_response_time_m
#   @return [Float, nil]
#
# @!attribute [rw] cache
#   @return [Hash, nil]
#
# @!attribute [rw] errors_by_type
#   @return [Hash, nil]
#
# @!attribute [rw] last_updated
#   @return [String, nil]
#
# @!attribute [rw] memory_used_byte
#   @return [Integer, nil]
#
# @!attribute [rw] redis_cache
#   @return [Hash, nil]
#
# @!attribute [rw] requests_per_second
#   @return [Float, nil]
#
# @!attribute [rw] start_time
#   @return [String, nil]
#
# @!attribute [rw] system
#   @return [Hash, nil]
#
# @!attribute [rw] total_error
#   @return [Integer, nil]
#
# @!attribute [rw] total_request
#   @return [Integer, nil]
#
# @!attribute [rw] wz_properties_loaded
#   @return [Integer, nil]
PerformanceMetric = Struct.new(
  :active_request,
  :average_response_time_m,
  :cache,
  :errors_by_type,
  :last_updated,
  :memory_used_byte,
  :redis_cache,
  :requests_per_second,
  :start_time,
  :system,
  :total_error,
  :total_request,
  :wz_properties_loaded,
  keyword_init: true
)

# Request payload for PerformanceMetric#load.
#
# @!attribute [rw] active_request
#   @return [Integer, nil]
#
# @!attribute [rw] average_response_time_m
#   @return [Float, nil]
#
# @!attribute [rw] cache
#   @return [Hash, nil]
#
# @!attribute [rw] errors_by_type
#   @return [Hash, nil]
#
# @!attribute [rw] last_updated
#   @return [String, nil]
#
# @!attribute [rw] memory_used_byte
#   @return [Integer, nil]
#
# @!attribute [rw] redis_cache
#   @return [Hash, nil]
#
# @!attribute [rw] requests_per_second
#   @return [Float, nil]
#
# @!attribute [rw] start_time
#   @return [String, nil]
#
# @!attribute [rw] system
#   @return [Hash, nil]
#
# @!attribute [rw] total_error
#   @return [Integer, nil]
#
# @!attribute [rw] total_request
#   @return [Integer, nil]
#
# @!attribute [rw] wz_properties_loaded
#   @return [Integer, nil]
PerformanceMetricLoadMatch = Struct.new(
  :active_request,
  :average_response_time_m,
  :cache,
  :errors_by_type,
  :last_updated,
  :memory_used_byte,
  :redis_cache,
  :requests_per_second,
  :start_time,
  :system,
  :total_error,
  :total_request,
  :wz_properties_loaded,
  keyword_init: true
)

# Pet entity data model.
class Pet
end

# Request payload for Pet#load.
#
# @!attribute [rw] animation
#   @return [String]
#
# @!attribute [rw] pet_id
#   @return [Integer]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer]
#
# @!attribute [rw] render_id
#   @return [String]
PetLoadMatch = Struct.new(
  :animation,
  :pet_id,
  :region,
  :version,
  :id,
  :render_id,
  keyword_init: true
)

# Quest entity data model.
class Quest
end

# Request payload for Quest#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] category
#   @return [Integer]
#
# @!attribute [rw] id
#   @return [Integer]
QuestLoadMatch = Struct.new(
  :region,
  :version,
  :category,
  :id,
  keyword_init: true
)

# System entity data model.
#
# @!attribute [rw] cpu_usage_percent
#   @return [Float, nil]
#
# @!attribute [rw] gc_gen0_collection
#   @return [Integer, nil]
#
# @!attribute [rw] gc_gen1_collection
#   @return [Integer, nil]
#
# @!attribute [rw] gc_gen2_collection
#   @return [Integer, nil]
#
# @!attribute [rw] thread_count
#   @return [Integer, nil]
#
# @!attribute [rw] total_memory_byte
#   @return [Integer, nil]
#
# @!attribute [rw] used_memory_byte
#   @return [Integer, nil]
System = Struct.new(
  :cpu_usage_percent,
  :gc_gen0_collection,
  :gc_gen1_collection,
  :gc_gen2_collection,
  :thread_count,
  :total_memory_byte,
  :used_memory_byte,
  keyword_init: true
)

# Request payload for System#load.
#
# @!attribute [rw] cpu_usage_percent
#   @return [Float, nil]
#
# @!attribute [rw] gc_gen0_collection
#   @return [Integer, nil]
#
# @!attribute [rw] gc_gen1_collection
#   @return [Integer, nil]
#
# @!attribute [rw] gc_gen2_collection
#   @return [Integer, nil]
#
# @!attribute [rw] thread_count
#   @return [Integer, nil]
#
# @!attribute [rw] total_memory_byte
#   @return [Integer, nil]
#
# @!attribute [rw] used_memory_byte
#   @return [Integer, nil]
SystemLoadMatch = Struct.new(
  :cpu_usage_percent,
  :gc_gen0_collection,
  :gc_gen1_collection,
  :gc_gen2_collection,
  :thread_count,
  :total_memory_byte,
  :used_memory_byte,
  keyword_init: true
)

# Tip entity data model.
class Tip
end

# Request payload for Tip#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
TipLoadMatch = Struct.new(
  :region,
  :version,
  keyword_init: true
)

# Wzn entity data model.
class Wzn
end

# Request payload for Wzn#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
WznLoadMatch = Struct.new(
  :region,
  :version,
  keyword_init: true
)

# Wzn2 entity data model.
class Wzn2
end

# Request payload for Wzn2#load.
#
# @!attribute [rw] path
#   @return [String]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
Wzn2LoadMatch = Struct.new(
  :path,
  :region,
  :version,
  keyword_init: true
)

# Wzn3 entity data model.
class Wzn3
end

# Request payload for Wzn3#load.
#
# @!attribute [rw] path
#   @return [String]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
Wzn3LoadMatch = Struct.new(
  :path,
  :region,
  :version,
  keyword_init: true
)

# Wzn4 entity data model.
class Wzn4
end

# Request payload for Wzn4#load.
#
# @!attribute [rw] path
#   @return [String]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
Wzn4LoadMatch = Struct.new(
  :path,
  :region,
  :version,
  keyword_init: true
)

# Wzn5 entity data model.
class Wzn5
end

# Request payload for Wzn5#load.
#
# @!attribute [rw] path
#   @return [String]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
Wzn5LoadMatch = Struct.new(
  :path,
  :region,
  :version,
  keyword_init: true
)

# Wzn6 entity data model.
class Wzn6
end

# Request payload for Wzn6#load.
#
# @!attribute [rw] path
#   @return [String]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
Wzn6LoadMatch = Struct.new(
  :path,
  :region,
  :version,
  keyword_init: true
)

# ZMap entity data model.
class ZMap
end

# Request payload for ZMap#load.
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
ZMapLoadMatch = Struct.new(
  :region,
  :version,
  keyword_init: true
)

