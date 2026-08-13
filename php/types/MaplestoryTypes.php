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
    public ?int $id = null;
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
    public ?string $character_id = null;
    public int $frame;
    public ?string $item = null;
}

/** Cache entity data model. */
class Cache
{
    public ?int $evictionCount = null;
    public ?int $hitCount = null;
    public ?float $hitRatio = null;
    public ?int $memoryUsage = null;
    public ?int $missCount = null;
    public ?int $totalEntries = null;
}

/** Request payload for Cache#load. */
class CacheLoadMatch
{
    public ?int $evictionCount = null;
    public ?int $hitCount = null;
    public ?float $hitRatio = null;
    public ?int $memoryUsage = null;
    public ?int $missCount = null;
    public ?int $totalEntries = null;
}

/** Character entity data model. */
class Character
{
}

/** Request payload for Character#load. */
class CharacterLoadMatch
{
    public ?string $frame = null;
    public string $region;
    public ?int $skin_id = null;
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
    public ?string $lastSeen = null;
    public ?array $metrics = null;
}

/** Request payload for Cluster#list. */
class ClusterListMatch
{
    public ?string $hostname = null;
    public ?string $lastSeen = null;
    public ?array $metrics = null;
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

/** Request payload for Entity1#load. */
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
    public ?int $id = null;
}

/** GuildMark entity data model. */
class GuildMark
{
}

/** Request payload for GuildMark#load. */
class GuildMarkLoadMatch
{
    public ?int $guild_background_color_id = null;
    public ?int $guild_background_id = null;
    public ?int $guild_mark_color_id = null;
    public int $guild_mark_id;
    public string $region;
    public string $version;
    public ?int $color_id = null;
}

/** Health entity data model. */
class Health
{
}

/** Request payload for Health#load. */
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
    public ?int $id = null;
    public ?string $overall_category = null;
}

/** Job entity data model. */
class Job
{
}

/** Request payload for Job#load. */
class JobLoadMatch
{
    public ?int $id = null;
    public string $region;
    public ?int $skill_id = null;
    public string $version;
}

/** Map entity data model. */
class Map
{
}

/** Request payload for Map#load. */
class MapLoadMatch
{
    public ?int $frame = null;
    public ?int $layer = null;
    public ?int $map_id = null;
    public string $region;
    public string $version;
    public ?int $id = null;
    public ?string $map = null;
    public ?string $mark_name = null;
}

/** Metric entity data model. */
class Metric
{
}

/** Request payload for Metric#load. */
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
    public ?string $animation = null;
    public ?int $id = null;
    public ?int $mob_id = null;
    public ?int $frame = null;
    public ?string $sound_name = null;
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
    public ?string $framebook = null;
    public ?int $id = null;
    public string $region;
    public string $version;
    public ?int $npc_id = null;
}

/** Nxf entity data model. */
class Nxf
{
}

/** Request payload for Nxf#load. */
class NxfLoadMatch
{
}

/** PerformanceMetric entity data model. */
class PerformanceMetric
{
    public ?int $activeRequests = null;
    public ?float $averageResponseTimeMs = null;
    public ?array $cache = null;
    public ?array $errorsByType = null;
    public ?string $lastUpdated = null;
    public ?int $memoryUsedBytes = null;
    public ?array $redisCache = null;
    public ?float $requestsPerSecond = null;
    public ?string $startTime = null;
    public ?array $system = null;
    public ?int $totalErrors = null;
    public ?int $totalRequests = null;
    public ?int $wzPropertiesLoaded = null;
}

/** Request payload for PerformanceMetric#load. */
class PerformanceMetricLoadMatch
{
    public ?int $activeRequests = null;
    public ?float $averageResponseTimeMs = null;
    public ?array $cache = null;
    public ?array $errorsByType = null;
    public ?string $lastUpdated = null;
    public ?int $memoryUsedBytes = null;
    public ?array $redisCache = null;
    public ?float $requestsPerSecond = null;
    public ?string $startTime = null;
    public ?array $system = null;
    public ?int $totalErrors = null;
    public ?int $totalRequests = null;
    public ?int $wzPropertiesLoaded = null;
}

/** Pet entity data model. */
class Pet
{
}

/** Request payload for Pet#load. */
class PetLoadMatch
{
    public ?string $animation = null;
    public ?int $pet_id = null;
    public string $region;
    public string $version;
    public ?int $id = null;
    public ?string $render_id = null;
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
    public ?int $category = null;
    public ?int $id = null;
}

/** System entity data model. */
class System
{
    public ?float $cpuUsagePercent = null;
    public ?int $gcGen0Collections = null;
    public ?int $gcGen1Collections = null;
    public ?int $gcGen2Collections = null;
    public ?int $threadCount = null;
    public ?int $totalMemoryBytes = null;
    public ?int $usedMemoryBytes = null;
}

/** Request payload for System#load. */
class SystemLoadMatch
{
    public ?float $cpuUsagePercent = null;
    public ?int $gcGen0Collections = null;
    public ?int $gcGen1Collections = null;
    public ?int $gcGen2Collections = null;
    public ?int $threadCount = null;
    public ?int $totalMemoryBytes = null;
    public ?int $usedMemoryBytes = null;
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
    public ?string $path = null;
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

