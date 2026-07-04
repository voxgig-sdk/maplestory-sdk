<?php
declare(strict_types=1);

// Typed models for the Maplestory SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Android entity data model. */
class Android
{
}

/** Request payload for Android#load. */
class AndroidLoadMatch
{
    public int $id;
    public string $region;
    public string $version;
}

/** Avatar entity data model. */
class Avatar
{
}

/** Request payload for Avatar#load. */
class AvatarLoadMatch
{
    public string $animation;
    public string $character_id;
    public int $frame;
    public string $item;
}

/** Cache entity data model. */
class Cache
{
    public ?int $eviction_count = null;
    public ?int $hit_count = null;
    public ?float $hit_ratio = null;
    public ?int $memory_usage = null;
    public ?int $miss_count = null;
    public ?int $total_entry = null;
}

/** Match filter for Cache#load (any subset of Cache fields). */
class CacheLoadMatch
{
    public ?int $eviction_count = null;
    public ?int $hit_count = null;
    public ?float $hit_ratio = null;
    public ?int $memory_usage = null;
    public ?int $miss_count = null;
    public ?int $total_entry = null;
}

/** Character entity data model. */
class Character
{
}

/** Request payload for Character#load. */
class CharacterLoadMatch
{
    public string $frame;
    public string $region;
    public int $skin_id;
    public string $version;
}

/** Chat entity data model. */
class Chat
{
}

/** Request payload for Chat#load. */
class ChatLoadMatch
{
    public string $region;
    public string $version;
}

/** Cluster entity data model. */
class Cluster
{
    public ?string $hostname = null;
    public ?string $last_seen = null;
    public ?array $metric = null;
}

/** Match filter for Cluster#list (any subset of Cluster fields). */
class ClusterListMatch
{
    public ?string $hostname = null;
    public ?string $last_seen = null;
    public ?array $metric = null;
}

/** Diff entity data model. */
class Diff
{
}

/** Request payload for Diff#load. */
class DiffLoadMatch
{
    public string $region;
    public string $version;
}

/** Entity1 entity data model. */
class Entity1
{
}

/** Match filter for Entity1#load (any subset of Entity1 fields). */
class Entity1LoadMatch
{
}

/** GmsNew entity data model. */
class GmsNew
{
}

/** Request payload for GmsNew#load. */
class GmsNewLoadMatch
{
    public int $id;
}

/** GuildMark entity data model. */
class GuildMark
{
}

/** Request payload for GuildMark#load. */
class GuildMarkLoadMatch
{
    public int $guild_background_color_id;
    public int $guild_background_id;
    public int $guild_mark_color_id;
    public int $guild_mark_id;
    public string $region;
    public string $version;
    public int $color_id;
}

/** Health entity data model. */
class Health
{
}

/** Match filter for Health#load (any subset of Health fields). */
class HealthLoadMatch
{
}

/** Item entity data model. */
class Item
{
}

/** Request payload for Item#load. */
class ItemLoadMatch
{
    public string $region;
    public string $version;
    public int $id;
    public string $overall_category;
}

/** Job entity data model. */
class Job
{
}

/** Request payload for Job#load. */
class JobLoadMatch
{
    public int $id;
    public string $region;
    public int $skill_id;
    public string $version;
}

/** Map entity data model. */
class Map
{
}

/** Request payload for Map#load. */
class MapLoadMatch
{
    public int $frame;
    public int $layer;
    public int $map_id;
    public string $region;
    public string $version;
    public int $id;
    public string $map;
    public string $mark_name;
}

/** Metric entity data model. */
class Metric
{
}

/** Match filter for Metric#load (any subset of Metric fields). */
class MetricLoadMatch
{
}

/** Mob entity data model. */
class Mob
{
}

/** Request payload for Mob#load. */
class MobLoadMatch
{
    public string $region;
    public string $version;
    public string $animation;
    public int $id;
    public int $mob_id;
    public int $frame;
    public string $sound_name;
}

/** Music entity data model. */
class Music
{
}

/** Request payload for Music#load. */
class MusicLoadMatch
{
    public string $id;
    public string $region;
    public string $version;
}

/** Name entity data model. */
class Name
{
}

/** Request payload for Name#load. */
class NameLoadMatch
{
    public string $region;
    public string $version;
}

/** Npc entity data model. */
class Npc
{
}

/** Request payload for Npc#load. */
class NpcLoadMatch
{
    public string $framebook;
    public int $id;
    public string $region;
    public string $version;
    public int $npc_id;
}

/** Nxf entity data model. */
class Nxf
{
}

/** Match filter for Nxf#load (any subset of Nxf fields). */
class NxfLoadMatch
{
}

/** PerformanceMetric entity data model. */
class PerformanceMetric
{
    public ?int $active_request = null;
    public ?float $average_response_time_m = null;
    public ?array $cache = null;
    public ?array $errors_by_type = null;
    public ?string $last_updated = null;
    public ?int $memory_used_byte = null;
    public ?array $redis_cache = null;
    public ?float $requests_per_second = null;
    public ?string $start_time = null;
    public ?array $system = null;
    public ?int $total_error = null;
    public ?int $total_request = null;
    public ?int $wz_properties_loaded = null;
}

/** Match filter for PerformanceMetric#load (any subset of PerformanceMetric fields). */
class PerformanceMetricLoadMatch
{
    public ?int $active_request = null;
    public ?float $average_response_time_m = null;
    public ?array $cache = null;
    public ?array $errors_by_type = null;
    public ?string $last_updated = null;
    public ?int $memory_used_byte = null;
    public ?array $redis_cache = null;
    public ?float $requests_per_second = null;
    public ?string $start_time = null;
    public ?array $system = null;
    public ?int $total_error = null;
    public ?int $total_request = null;
    public ?int $wz_properties_loaded = null;
}

/** Pet entity data model. */
class Pet
{
}

/** Request payload for Pet#load. */
class PetLoadMatch
{
    public string $animation;
    public int $pet_id;
    public string $region;
    public string $version;
    public int $id;
    public string $render_id;
}

/** Quest entity data model. */
class Quest
{
}

/** Request payload for Quest#load. */
class QuestLoadMatch
{
    public string $region;
    public string $version;
    public int $category;
    public int $id;
}

/** System entity data model. */
class System
{
    public ?float $cpu_usage_percent = null;
    public ?int $gc_gen0_collection = null;
    public ?int $gc_gen1_collection = null;
    public ?int $gc_gen2_collection = null;
    public ?int $thread_count = null;
    public ?int $total_memory_byte = null;
    public ?int $used_memory_byte = null;
}

/** Match filter for System#load (any subset of System fields). */
class SystemLoadMatch
{
    public ?float $cpu_usage_percent = null;
    public ?int $gc_gen0_collection = null;
    public ?int $gc_gen1_collection = null;
    public ?int $gc_gen2_collection = null;
    public ?int $thread_count = null;
    public ?int $total_memory_byte = null;
    public ?int $used_memory_byte = null;
}

/** Tip entity data model. */
class Tip
{
}

/** Request payload for Tip#load. */
class TipLoadMatch
{
    public string $region;
    public string $version;
}

/** Wzn entity data model. */
class Wzn
{
}

/** Request payload for Wzn#load. */
class WznLoadMatch
{
    public string $region;
    public string $version;
}

/** Wzn2 entity data model. */
class Wzn2
{
}

/** Request payload for Wzn2#load. */
class Wzn2LoadMatch
{
    public string $path;
    public string $region;
    public string $version;
}

/** Wzn3 entity data model. */
class Wzn3
{
}

/** Request payload for Wzn3#load. */
class Wzn3LoadMatch
{
    public string $path;
    public string $region;
    public string $version;
}

/** Wzn4 entity data model. */
class Wzn4
{
}

/** Request payload for Wzn4#load. */
class Wzn4LoadMatch
{
    public string $path;
    public string $region;
    public string $version;
}

/** Wzn5 entity data model. */
class Wzn5
{
}

/** Request payload for Wzn5#load. */
class Wzn5LoadMatch
{
    public string $path;
    public string $region;
    public string $version;
}

/** Wzn6 entity data model. */
class Wzn6
{
}

/** Request payload for Wzn6#load. */
class Wzn6LoadMatch
{
    public string $path;
    public string $region;
    public string $version;
}

/** ZMap entity data model. */
class ZMap
{
}

/** Request payload for ZMap#load. */
class ZMapLoadMatch
{
    public string $region;
    public string $version;
}

