# Typed models for the Maplestory SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Android:
    pass


@dataclass
class AndroidLoadMatch:
    id: int
    region: str
    version: str


@dataclass
class Avatar:
    pass


@dataclass
class AvatarLoadMatch:
    animation: str
    character_id: str
    frame: int
    item: str


@dataclass
class Cache:
    eviction_count: Optional[int] = None
    hit_count: Optional[int] = None
    hit_ratio: Optional[float] = None
    memory_usage: Optional[int] = None
    miss_count: Optional[int] = None
    total_entry: Optional[int] = None


@dataclass
class CacheLoadMatch:
    eviction_count: Optional[int] = None
    hit_count: Optional[int] = None
    hit_ratio: Optional[float] = None
    memory_usage: Optional[int] = None
    miss_count: Optional[int] = None
    total_entry: Optional[int] = None


@dataclass
class Character:
    pass


@dataclass
class CharacterLoadMatch:
    frame: str
    region: str
    skin_id: int
    version: str


@dataclass
class Chat:
    pass


@dataclass
class ChatLoadMatch:
    region: str
    version: str


@dataclass
class Cluster:
    hostname: Optional[str] = None
    last_seen: Optional[str] = None
    metric: Optional[dict] = None


@dataclass
class ClusterListMatch:
    hostname: Optional[str] = None
    last_seen: Optional[str] = None
    metric: Optional[dict] = None


@dataclass
class Diff:
    pass


@dataclass
class DiffLoadMatch:
    region: str
    version: str


@dataclass
class Entity1:
    pass


@dataclass
class Entity1LoadMatch:
    pass


@dataclass
class GmsNew:
    pass


@dataclass
class GmsNewLoadMatch:
    id: int


@dataclass
class GuildMark:
    pass


@dataclass
class GuildMarkLoadMatch:
    guild_background_color_id: int
    guild_background_id: int
    guild_mark_color_id: int
    guild_mark_id: int
    region: str
    version: str
    color_id: int


@dataclass
class Health:
    pass


@dataclass
class HealthLoadMatch:
    pass


@dataclass
class Item:
    pass


@dataclass
class ItemLoadMatch:
    region: str
    version: str
    id: int
    overall_category: str


@dataclass
class Job:
    pass


@dataclass
class JobLoadMatch:
    id: int
    region: str
    skill_id: int
    version: str


@dataclass
class Map:
    pass


@dataclass
class MapLoadMatch:
    frame: int
    layer: int
    map_id: int
    region: str
    version: str
    id: int
    map: str
    mark_name: str


@dataclass
class Metric:
    pass


@dataclass
class MetricLoadMatch:
    pass


@dataclass
class Mob:
    pass


@dataclass
class MobLoadMatch:
    region: str
    version: str
    animation: str
    id: int
    mob_id: int
    frame: int
    sound_name: str


@dataclass
class Music:
    pass


@dataclass
class MusicLoadMatch:
    id: str
    region: str
    version: str


@dataclass
class Name:
    pass


@dataclass
class NameLoadMatch:
    region: str
    version: str


@dataclass
class Npc:
    pass


@dataclass
class NpcLoadMatch:
    framebook: str
    id: int
    region: str
    version: str
    npc_id: int


@dataclass
class Nxf:
    pass


@dataclass
class NxfLoadMatch:
    pass


@dataclass
class PerformanceMetric:
    active_request: Optional[int] = None
    average_response_time_m: Optional[float] = None
    cache: Optional[dict] = None
    errors_by_type: Optional[dict] = None
    last_updated: Optional[str] = None
    memory_used_byte: Optional[int] = None
    redis_cache: Optional[dict] = None
    requests_per_second: Optional[float] = None
    start_time: Optional[str] = None
    system: Optional[dict] = None
    total_error: Optional[int] = None
    total_request: Optional[int] = None
    wz_properties_loaded: Optional[int] = None


@dataclass
class PerformanceMetricLoadMatch:
    active_request: Optional[int] = None
    average_response_time_m: Optional[float] = None
    cache: Optional[dict] = None
    errors_by_type: Optional[dict] = None
    last_updated: Optional[str] = None
    memory_used_byte: Optional[int] = None
    redis_cache: Optional[dict] = None
    requests_per_second: Optional[float] = None
    start_time: Optional[str] = None
    system: Optional[dict] = None
    total_error: Optional[int] = None
    total_request: Optional[int] = None
    wz_properties_loaded: Optional[int] = None


@dataclass
class Pet:
    pass


@dataclass
class PetLoadMatch:
    animation: str
    pet_id: int
    region: str
    version: str
    id: int
    render_id: str


@dataclass
class Quest:
    pass


@dataclass
class QuestLoadMatch:
    region: str
    version: str
    category: int
    id: int


@dataclass
class System:
    cpu_usage_percent: Optional[float] = None
    gc_gen0_collection: Optional[int] = None
    gc_gen1_collection: Optional[int] = None
    gc_gen2_collection: Optional[int] = None
    thread_count: Optional[int] = None
    total_memory_byte: Optional[int] = None
    used_memory_byte: Optional[int] = None


@dataclass
class SystemLoadMatch:
    cpu_usage_percent: Optional[float] = None
    gc_gen0_collection: Optional[int] = None
    gc_gen1_collection: Optional[int] = None
    gc_gen2_collection: Optional[int] = None
    thread_count: Optional[int] = None
    total_memory_byte: Optional[int] = None
    used_memory_byte: Optional[int] = None


@dataclass
class Tip:
    pass


@dataclass
class TipLoadMatch:
    region: str
    version: str


@dataclass
class Wzn:
    pass


@dataclass
class WznLoadMatch:
    region: str
    version: str


@dataclass
class Wzn2:
    pass


@dataclass
class Wzn2LoadMatch:
    path: str
    region: str
    version: str


@dataclass
class Wzn3:
    pass


@dataclass
class Wzn3LoadMatch:
    path: str
    region: str
    version: str


@dataclass
class Wzn4:
    pass


@dataclass
class Wzn4LoadMatch:
    path: str
    region: str
    version: str


@dataclass
class Wzn5:
    pass


@dataclass
class Wzn5LoadMatch:
    path: str
    region: str
    version: str


@dataclass
class Wzn6:
    pass


@dataclass
class Wzn6LoadMatch:
    path: str
    region: str
    version: str


@dataclass
class ZMap:
    pass


@dataclass
class ZMapLoadMatch:
    region: str
    version: str

