# Typed models for the Maplestory SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Android(TypedDict, total=False):
    id: str


class AndroidLoadMatchRequired(TypedDict):
    region: str
    version: str


class AndroidLoadMatch(AndroidLoadMatchRequired, total=False):
    id: int


class Avatar(TypedDict):
    pass


class AvatarLoadMatchRequired(TypedDict):
    animation: str
    frame: int


class AvatarLoadMatch(AvatarLoadMatchRequired, total=False):
    character_id: str
    bg_color: str
    flip_x: bool
    name: str
    padding: int
    render_mode: int
    resize: float
    show_ear: bool
    show_high_lef_ear: bool
    show_lef_ear: bool
    format: int
    item: str


class Cache(TypedDict, total=False):
    evictionCount: int
    hitCount: int
    hitRatio: float
    memoryUsage: int
    missCount: int
    totalEntries: int


class CacheLoadMatch(TypedDict, total=False):
    evictionCount: int
    hitCount: int
    hitRatio: float
    memoryUsage: int
    missCount: int
    totalEntries: int


class Character(TypedDict):
    pass


class CharacterLoadMatchRequired(TypedDict):
    region: str
    version: str


class CharacterLoadMatch(CharacterLoadMatchRequired, total=False):
    frame: str
    skin_id: int
    animation: str
    bg_color: str
    flip_x: bool
    item: str
    name: str
    padding: int
    render_mode: int
    resize: float
    show_ear: bool
    show_high_lef_ear: bool
    show_lef_ear: bool
    format: int


class Chat(TypedDict):
    pass


class ChatLoadMatchRequired(TypedDict):
    region: str
    version: str


class ChatLoadMatch(ChatLoadMatchRequired, total=False):
    message: str
    ring_ids_joined: str


class Cluster(TypedDict, total=False):
    hostname: str
    lastSeen: str
    metrics: dict


class ClusterListMatch(TypedDict, total=False):
    hostname: str
    lastSeen: str
    metrics: dict


class Diff(TypedDict):
    pass


class DiffLoadMatch(TypedDict):
    region: str
    version: str


class Entity1(TypedDict):
    pass


class Entity1LoadMatch(TypedDict):
    pass


class GmsNew(TypedDict, total=False):
    id: str


class GmsNewLoadMatch(TypedDict, total=False):
    type: str


class GuildMark(TypedDict):
    pass


class GuildMarkLoadMatchRequired(TypedDict):
    guild_mark_id: int
    region: str
    version: str


class GuildMarkLoadMatch(GuildMarkLoadMatchRequired, total=False):
    guild_background_color_id: int
    guild_background_id: int
    guild_mark_color_id: int
    color_id: int


class Health(TypedDict):
    pass


class HealthLoadMatch(TypedDict):
    pass


class Item(TypedDict, total=False):
    id: str


class ItemLoadMatchRequired(TypedDict):
    region: str
    version: str


class ItemLoadMatch(ItemLoadMatchRequired, total=False):
    cash_filter: bool
    category_filter: str
    count: int
    gender_filter: int
    job_filter: int
    max_level_filter: int
    min_level_filter: int
    overall_category_filter: str
    search_for: str
    start_position: int
    sub_category_filter: str
    id: int
    overall_category: str


class Job(TypedDict, total=False):
    id: str


class JobLoadMatchRequired(TypedDict):
    region: str
    version: str


class JobLoadMatch(JobLoadMatchRequired, total=False):
    id: int
    skill_id: int


class Map(TypedDict, total=False):
    id: str


class MapLoadMatchRequired(TypedDict):
    region: str
    version: str


class MapLoadMatch(MapLoadMatchRequired, total=False):
    frame: int
    layer: int
    map_id: int
    filter_trash: bool
    min_x: int
    min_y: int
    id: int
    show_life: bool
    show_portal: bool
    count: int
    search_for: str
    start_position: int
    map: str
    mark_name: str


class Metric(TypedDict):
    pass


class MetricLoadMatch(TypedDict):
    pass


class Mob(TypedDict, total=False):
    id: str


class MobLoadMatchRequired(TypedDict):
    region: str
    version: str


class MobLoadMatch(MobLoadMatchRequired, total=False):
    count: int
    max_level_filter: int
    min_level_filter: int
    search_for: str
    start_position: int
    animation: str
    id: int
    bg_color: str
    mob_id: int
    frame: int
    sound_name: str


class Music(TypedDict, total=False):
    id: str


class MusicLoadMatch(TypedDict):
    id: str
    region: str
    version: str


class Name(TypedDict):
    pass


class NameLoadMatchRequired(TypedDict):
    region: str
    version: str


class NameLoadMatch(NameLoadMatchRequired, total=False):
    name: str
    ring_ids_joined: str


class Npc(TypedDict, total=False):
    id: str


class NpcLoadMatchRequired(TypedDict):
    region: str
    version: str


class NpcLoadMatch(NpcLoadMatchRequired, total=False):
    framebook: str
    id: int
    animation: str
    bg_color: str
    npc_id: int
    frame: int
    count: int
    search_for: str
    start_at: int


class Nxf(TypedDict):
    pass


class NxfLoadMatch(TypedDict):
    pass


class PerformanceMetric(TypedDict, total=False):
    activeRequests: int
    averageResponseTimeMs: float
    cache: dict
    errorsByType: dict
    lastUpdated: str
    memoryUsedBytes: int
    redisCache: dict
    requestsPerSecond: float
    startTime: str
    system: dict
    totalErrors: int
    totalRequests: int
    wzPropertiesLoaded: int


class PerformanceMetricLoadMatch(TypedDict, total=False):
    activeRequests: int
    averageResponseTimeMs: float
    cache: dict
    errorsByType: dict
    lastUpdated: str
    memoryUsedBytes: int
    redisCache: dict
    requestsPerSecond: float
    startTime: str
    system: dict
    totalErrors: int
    totalRequests: int
    wzPropertiesLoaded: int


class Pet(TypedDict, total=False):
    id: str


class PetLoadMatchRequired(TypedDict):
    region: str
    version: str


class PetLoadMatch(PetLoadMatchRequired, total=False):
    animation: str
    pet_id: int
    frame: int
    pet_equip: int
    id: int
    render_id: str
    bg_color: str


class Quest(TypedDict, total=False):
    id: str


class QuestLoadMatchRequired(TypedDict):
    region: str
    version: str


class QuestLoadMatch(QuestLoadMatchRequired, total=False):
    count: int
    search_for: str
    start_position: int
    category: int
    id: int


class System(TypedDict, total=False):
    cpuUsagePercent: float
    gcGen0Collections: int
    gcGen1Collections: int
    gcGen2Collections: int
    threadCount: int
    totalMemoryBytes: int
    usedMemoryBytes: int


class SystemLoadMatch(TypedDict, total=False):
    cpuUsagePercent: float
    gcGen0Collections: int
    gcGen1Collections: int
    gcGen2Collections: int
    threadCount: int
    totalMemoryBytes: int
    usedMemoryBytes: int


class Tip(TypedDict):
    pass


class TipLoadMatch(TypedDict):
    region: str
    version: str


class Wzn(TypedDict):
    pass


class WznLoadMatchRequired(TypedDict):
    path: str


class WznLoadMatch(WznLoadMatchRequired, total=False):
    region: str
    version: str


class ZMap(TypedDict):
    pass


class ZMapLoadMatch(TypedDict):
    region: str
    version: str
