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
#   @return [Integer, nil]
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
#   @return [String, nil]
#
# @!attribute [rw] frame
#   @return [Integer]
#
# @!attribute [rw] item
#   @return [String, nil]
AvatarLoadMatch = Struct.new(
  :animation,
  :character_id,
  :frame,
  :item,
  keyword_init: true
)

# Cache entity data model.
#
# @!attribute [rw] evictionCount
#   @return [Integer, nil]
#
# @!attribute [rw] hitCount
#   @return [Integer, nil]
#
# @!attribute [rw] hitRatio
#   @return [Float, nil]
#
# @!attribute [rw] memoryUsage
#   @return [Integer, nil]
#
# @!attribute [rw] missCount
#   @return [Integer, nil]
#
# @!attribute [rw] totalEntries
#   @return [Integer, nil]
Cache = Struct.new(
  :evictionCount,
  :hitCount,
  :hitRatio,
  :memoryUsage,
  :missCount,
  :totalEntries,
  keyword_init: true
)

# Request payload for Cache#load.
#
# @!attribute [rw] evictionCount
#   @return [Integer, nil]
#
# @!attribute [rw] hitCount
#   @return [Integer, nil]
#
# @!attribute [rw] hitRatio
#   @return [Float, nil]
#
# @!attribute [rw] memoryUsage
#   @return [Integer, nil]
#
# @!attribute [rw] missCount
#   @return [Integer, nil]
#
# @!attribute [rw] totalEntries
#   @return [Integer, nil]
CacheLoadMatch = Struct.new(
  :evictionCount,
  :hitCount,
  :hitRatio,
  :memoryUsage,
  :missCount,
  :totalEntries,
  keyword_init: true
)

# Character entity data model.
class Character
end

# Request payload for Character#load.
#
# @!attribute [rw] frame
#   @return [String, nil]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] skin_id
#   @return [Integer, nil]
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
# @!attribute [rw] lastSeen
#   @return [String, nil]
#
# @!attribute [rw] metrics
#   @return [Hash, nil]
Cluster = Struct.new(
  :hostname,
  :lastSeen,
  :metrics,
  keyword_init: true
)

# Request payload for Cluster#list.
#
# @!attribute [rw] hostname
#   @return [String, nil]
#
# @!attribute [rw] lastSeen
#   @return [String, nil]
#
# @!attribute [rw] metrics
#   @return [Hash, nil]
ClusterListMatch = Struct.new(
  :hostname,
  :lastSeen,
  :metrics,
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
#   @return [Integer, nil]
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
#   @return [Integer, nil]
#
# @!attribute [rw] guild_background_id
#   @return [Integer, nil]
#
# @!attribute [rw] guild_mark_color_id
#   @return [Integer, nil]
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
#   @return [Integer, nil]
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
#   @return [Integer, nil]
#
# @!attribute [rw] overall_category
#   @return [String, nil]
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
#   @return [Integer, nil]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] skill_id
#   @return [Integer, nil]
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
#   @return [Integer, nil]
#
# @!attribute [rw] layer
#   @return [Integer, nil]
#
# @!attribute [rw] map_id
#   @return [Integer, nil]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] map
#   @return [String, nil]
#
# @!attribute [rw] mark_name
#   @return [String, nil]
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
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] mob_id
#   @return [Integer, nil]
#
# @!attribute [rw] frame
#   @return [Integer, nil]
#
# @!attribute [rw] sound_name
#   @return [String, nil]
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
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] npc_id
#   @return [Integer, nil]
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
# @!attribute [rw] activeRequests
#   @return [Integer, nil]
#
# @!attribute [rw] averageResponseTimeMs
#   @return [Float, nil]
#
# @!attribute [rw] cache
#   @return [Hash, nil]
#
# @!attribute [rw] errorsByType
#   @return [Hash, nil]
#
# @!attribute [rw] lastUpdated
#   @return [String, nil]
#
# @!attribute [rw] memoryUsedBytes
#   @return [Integer, nil]
#
# @!attribute [rw] redisCache
#   @return [Hash, nil]
#
# @!attribute [rw] requestsPerSecond
#   @return [Float, nil]
#
# @!attribute [rw] startTime
#   @return [String, nil]
#
# @!attribute [rw] system
#   @return [Hash, nil]
#
# @!attribute [rw] totalErrors
#   @return [Integer, nil]
#
# @!attribute [rw] totalRequests
#   @return [Integer, nil]
#
# @!attribute [rw] wzPropertiesLoaded
#   @return [Integer, nil]
PerformanceMetric = Struct.new(
  :activeRequests,
  :averageResponseTimeMs,
  :cache,
  :errorsByType,
  :lastUpdated,
  :memoryUsedBytes,
  :redisCache,
  :requestsPerSecond,
  :startTime,
  :system,
  :totalErrors,
  :totalRequests,
  :wzPropertiesLoaded,
  keyword_init: true
)

# Request payload for PerformanceMetric#load.
#
# @!attribute [rw] activeRequests
#   @return [Integer, nil]
#
# @!attribute [rw] averageResponseTimeMs
#   @return [Float, nil]
#
# @!attribute [rw] cache
#   @return [Hash, nil]
#
# @!attribute [rw] errorsByType
#   @return [Hash, nil]
#
# @!attribute [rw] lastUpdated
#   @return [String, nil]
#
# @!attribute [rw] memoryUsedBytes
#   @return [Integer, nil]
#
# @!attribute [rw] redisCache
#   @return [Hash, nil]
#
# @!attribute [rw] requestsPerSecond
#   @return [Float, nil]
#
# @!attribute [rw] startTime
#   @return [String, nil]
#
# @!attribute [rw] system
#   @return [Hash, nil]
#
# @!attribute [rw] totalErrors
#   @return [Integer, nil]
#
# @!attribute [rw] totalRequests
#   @return [Integer, nil]
#
# @!attribute [rw] wzPropertiesLoaded
#   @return [Integer, nil]
PerformanceMetricLoadMatch = Struct.new(
  :activeRequests,
  :averageResponseTimeMs,
  :cache,
  :errorsByType,
  :lastUpdated,
  :memoryUsedBytes,
  :redisCache,
  :requestsPerSecond,
  :startTime,
  :system,
  :totalErrors,
  :totalRequests,
  :wzPropertiesLoaded,
  keyword_init: true
)

# Pet entity data model.
class Pet
end

# Request payload for Pet#load.
#
# @!attribute [rw] animation
#   @return [String, nil]
#
# @!attribute [rw] pet_id
#   @return [Integer, nil]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] render_id
#   @return [String, nil]
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
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
QuestLoadMatch = Struct.new(
  :region,
  :version,
  :category,
  :id,
  keyword_init: true
)

# System entity data model.
#
# @!attribute [rw] cpuUsagePercent
#   @return [Float, nil]
#
# @!attribute [rw] gcGen0Collections
#   @return [Integer, nil]
#
# @!attribute [rw] gcGen1Collections
#   @return [Integer, nil]
#
# @!attribute [rw] gcGen2Collections
#   @return [Integer, nil]
#
# @!attribute [rw] threadCount
#   @return [Integer, nil]
#
# @!attribute [rw] totalMemoryBytes
#   @return [Integer, nil]
#
# @!attribute [rw] usedMemoryBytes
#   @return [Integer, nil]
System = Struct.new(
  :cpuUsagePercent,
  :gcGen0Collections,
  :gcGen1Collections,
  :gcGen2Collections,
  :threadCount,
  :totalMemoryBytes,
  :usedMemoryBytes,
  keyword_init: true
)

# Request payload for System#load.
#
# @!attribute [rw] cpuUsagePercent
#   @return [Float, nil]
#
# @!attribute [rw] gcGen0Collections
#   @return [Integer, nil]
#
# @!attribute [rw] gcGen1Collections
#   @return [Integer, nil]
#
# @!attribute [rw] gcGen2Collections
#   @return [Integer, nil]
#
# @!attribute [rw] threadCount
#   @return [Integer, nil]
#
# @!attribute [rw] totalMemoryBytes
#   @return [Integer, nil]
#
# @!attribute [rw] usedMemoryBytes
#   @return [Integer, nil]
SystemLoadMatch = Struct.new(
  :cpuUsagePercent,
  :gcGen0Collections,
  :gcGen1Collections,
  :gcGen2Collections,
  :threadCount,
  :totalMemoryBytes,
  :usedMemoryBytes,
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
# @!attribute [rw] path
#   @return [String, nil]
#
# @!attribute [rw] region
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
WznLoadMatch = Struct.new(
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

