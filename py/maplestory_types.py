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


class Android(TypedDict):
    pass


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
    item: str


class Cache(TypedDict, total=False):
    eviction_count: int
    hit_count: int
    hit_ratio: float
    memory_usage: int
    miss_count: int
    total_entry: int


class CacheLoadMatch(TypedDict, total=False):
    eviction_count: int
    hit_count: int
    hit_ratio: float
    memory_usage: int
    miss_count: int
    total_entry: int


class Character(TypedDict):
    pass


class CharacterLoadMatchRequired(TypedDict):
    region: str
    version: str


class CharacterLoadMatch(CharacterLoadMatchRequired, total=False):
    frame: str
    skin_id: int


class Chat(TypedDict):
    pass


class ChatLoadMatch(TypedDict):
    region: str
    version: str


class Cluster(TypedDict, total=False):
    hostname: str
    last_seen: str
    metric: dict


class ClusterListMatch(TypedDict, total=False):
    hostname: str
    last_seen: str
    metric: dict


class Diff(TypedDict):
    pass


class DiffLoadMatch(TypedDict):
    region: str
    version: str


class Entity1(TypedDict):
    pass


class Entity1LoadMatch(TypedDict):
    pass


class GmsNew(TypedDict):
    pass


class GmsNewLoadMatch(TypedDict, total=False):
    id: int


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


class Item(TypedDict):
    pass


class ItemLoadMatchRequired(TypedDict):
    region: str
    version: str


class ItemLoadMatch(ItemLoadMatchRequired, total=False):
    id: int
    overall_category: str


class Job(TypedDict):
    pass


class JobLoadMatchRequired(TypedDict):
    region: str
    version: str


class JobLoadMatch(JobLoadMatchRequired, total=False):
    id: int
    skill_id: int


class Map(TypedDict):
    pass


class MapLoadMatchRequired(TypedDict):
    region: str
    version: str


class MapLoadMatch(MapLoadMatchRequired, total=False):
    frame: int
    layer: int
    map_id: int
    id: int
    map: str
    mark_name: str


class Metric(TypedDict):
    pass


class MetricLoadMatch(TypedDict):
    pass


class Mob(TypedDict):
    pass


class MobLoadMatchRequired(TypedDict):
    region: str
    version: str


class MobLoadMatch(MobLoadMatchRequired, total=False):
    animation: str
    id: int
    mob_id: int
    frame: int
    sound_name: str


class Music(TypedDict):
    pass


class MusicLoadMatch(TypedDict):
    id: str
    region: str
    version: str


class Name(TypedDict):
    pass


class NameLoadMatch(TypedDict):
    region: str
    version: str


class Npc(TypedDict):
    pass


class NpcLoadMatchRequired(TypedDict):
    region: str
    version: str


class NpcLoadMatch(NpcLoadMatchRequired, total=False):
    framebook: str
    id: int
    npc_id: int


class Nxf(TypedDict):
    pass


class NxfLoadMatch(TypedDict):
    pass


class PerformanceMetric(TypedDict, total=False):
    active_request: int
    average_response_time_m: float
    cache: dict
    errors_by_type: dict
    last_updated: str
    memory_used_byte: int
    redis_cache: dict
    requests_per_second: float
    start_time: str
    system: dict
    total_error: int
    total_request: int
    wz_properties_loaded: int


class PerformanceMetricLoadMatch(TypedDict, total=False):
    active_request: int
    average_response_time_m: float
    cache: dict
    errors_by_type: dict
    last_updated: str
    memory_used_byte: int
    redis_cache: dict
    requests_per_second: float
    start_time: str
    system: dict
    total_error: int
    total_request: int
    wz_properties_loaded: int


class Pet(TypedDict):
    pass


class PetLoadMatchRequired(TypedDict):
    region: str
    version: str


class PetLoadMatch(PetLoadMatchRequired, total=False):
    animation: str
    pet_id: int
    id: int
    render_id: str


class Quest(TypedDict):
    pass


class QuestLoadMatchRequired(TypedDict):
    region: str
    version: str


class QuestLoadMatch(QuestLoadMatchRequired, total=False):
    category: int
    id: int


class System(TypedDict, total=False):
    cpu_usage_percent: float
    gc_gen0_collection: int
    gc_gen1_collection: int
    gc_gen2_collection: int
    thread_count: int
    total_memory_byte: int
    used_memory_byte: int


class SystemLoadMatch(TypedDict, total=False):
    cpu_usage_percent: float
    gc_gen0_collection: int
    gc_gen1_collection: int
    gc_gen2_collection: int
    thread_count: int
    total_memory_byte: int
    used_memory_byte: int


class Tip(TypedDict):
    pass


class TipLoadMatch(TypedDict):
    region: str
    version: str


class Wzn(TypedDict):
    pass


class WznLoadMatch(TypedDict):
    region: str
    version: str


class Wzn2(TypedDict):
    pass


class Wzn2LoadMatch(TypedDict):
    path: str
    region: str
    version: str


class Wzn3(TypedDict):
    pass


class Wzn3LoadMatch(TypedDict):
    path: str
    region: str
    version: str


class Wzn4(TypedDict):
    pass


class Wzn4LoadMatch(TypedDict):
    path: str
    region: str
    version: str


class Wzn5(TypedDict):
    pass


class Wzn5LoadMatch(TypedDict):
    path: str
    region: str
    version: str


class Wzn6(TypedDict):
    pass


class Wzn6LoadMatch(TypedDict):
    path: str
    region: str
    version: str


class ZMap(TypedDict):
    pass


class ZMapLoadMatch(TypedDict):
    region: str
    version: str
