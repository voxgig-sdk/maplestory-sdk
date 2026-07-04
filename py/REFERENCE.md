# Maplestory Python SDK Reference

Complete API reference for the Maplestory Python SDK.


## MaplestorySDK

### Constructor

```python
from maplestory_sdk import MaplestorySDK

client = MaplestorySDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `MaplestorySDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = MaplestorySDK.test()
```


### Instance Methods

#### `Android(data=None)`

Create a new `AndroidEntity` instance. Pass `None` for no initial data.

#### `Avatar(data=None)`

Create a new `AvatarEntity` instance. Pass `None` for no initial data.

#### `Cache(data=None)`

Create a new `CacheEntity` instance. Pass `None` for no initial data.

#### `Character(data=None)`

Create a new `CharacterEntity` instance. Pass `None` for no initial data.

#### `Chat(data=None)`

Create a new `ChatEntity` instance. Pass `None` for no initial data.

#### `Cluster(data=None)`

Create a new `ClusterEntity` instance. Pass `None` for no initial data.

#### `Diff(data=None)`

Create a new `DiffEntity` instance. Pass `None` for no initial data.

#### `Entity1(data=None)`

Create a new `Entity1Entity` instance. Pass `None` for no initial data.

#### `GmsNew(data=None)`

Create a new `GmsNewEntity` instance. Pass `None` for no initial data.

#### `GuildMark(data=None)`

Create a new `GuildMarkEntity` instance. Pass `None` for no initial data.

#### `Health(data=None)`

Create a new `HealthEntity` instance. Pass `None` for no initial data.

#### `Item(data=None)`

Create a new `ItemEntity` instance. Pass `None` for no initial data.

#### `Job(data=None)`

Create a new `JobEntity` instance. Pass `None` for no initial data.

#### `Map(data=None)`

Create a new `MapEntity` instance. Pass `None` for no initial data.

#### `Metric(data=None)`

Create a new `MetricEntity` instance. Pass `None` for no initial data.

#### `Mob(data=None)`

Create a new `MobEntity` instance. Pass `None` for no initial data.

#### `Music(data=None)`

Create a new `MusicEntity` instance. Pass `None` for no initial data.

#### `Name(data=None)`

Create a new `NameEntity` instance. Pass `None` for no initial data.

#### `Npc(data=None)`

Create a new `NpcEntity` instance. Pass `None` for no initial data.

#### `Nxf(data=None)`

Create a new `NxfEntity` instance. Pass `None` for no initial data.

#### `PerformanceMetric(data=None)`

Create a new `PerformanceMetricEntity` instance. Pass `None` for no initial data.

#### `Pet(data=None)`

Create a new `PetEntity` instance. Pass `None` for no initial data.

#### `Quest(data=None)`

Create a new `QuestEntity` instance. Pass `None` for no initial data.

#### `System(data=None)`

Create a new `SystemEntity` instance. Pass `None` for no initial data.

#### `Tip(data=None)`

Create a new `TipEntity` instance. Pass `None` for no initial data.

#### `Wzn(data=None)`

Create a new `WznEntity` instance. Pass `None` for no initial data.

#### `Wzn2(data=None)`

Create a new `Wzn2Entity` instance. Pass `None` for no initial data.

#### `Wzn3(data=None)`

Create a new `Wzn3Entity` instance. Pass `None` for no initial data.

#### `Wzn4(data=None)`

Create a new `Wzn4Entity` instance. Pass `None` for no initial data.

#### `Wzn5(data=None)`

Create a new `Wzn5Entity` instance. Pass `None` for no initial data.

#### `Wzn6(data=None)`

Create a new `Wzn6Entity` instance. Pass `None` for no initial data.

#### `ZMap(data=None)`

Create a new `ZMapEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AndroidEntity

```python
android = client.android
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.android.load({"id": "android_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AndroidEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## AvatarEntity

```python
avatar = client.avatar
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.avatar.load({"id": "avatar_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AvatarEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## CacheEntity

```python
cache = client.cache
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `eviction_count` | ``$INTEGER`` | No |  |
| `hit_count` | ``$INTEGER`` | No |  |
| `hit_ratio` | ``$NUMBER`` | No |  |
| `memory_usage` | ``$INTEGER`` | No |  |
| `miss_count` | ``$INTEGER`` | No |  |
| `total_entry` | ``$INTEGER`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.cache.load({"id": "cache_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CacheEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## CharacterEntity

```python
character = client.character
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.character.load({"id": "character_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CharacterEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ChatEntity

```python
chat = client.chat
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.chat.load({"id": "chat_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ChatEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ClusterEntity

```python
cluster = client.cluster
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hostname` | ``$STRING`` | No |  |
| `last_seen` | ``$STRING`` | No |  |
| `metric` | ``$OBJECT`` | No |  |

### Operations

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.cluster.list({})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ClusterEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DiffEntity

```python
diff = client.diff
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.diff.load({"id": "diff_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DiffEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Entity1Entity

```python
entity1 = client.entity1
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.entity1.load({"id": "entity1_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Entity1Entity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## GmsNewEntity

```python
gms_new = client.gms_new
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.gms_new.load({"id": "gms_new_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GmsNewEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## GuildMarkEntity

```python
guild_mark = client.guild_mark
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.guild_mark.load({"id": "guild_mark_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GuildMarkEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## HealthEntity

```python
health = client.health
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.health.load({"id": "health_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HealthEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ItemEntity

```python
item = client.item
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.item.load({"id": "item_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ItemEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## JobEntity

```python
job = client.job
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.job.load({"id": "job_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `JobEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MapEntity

```python
map = client.map
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.map.load({"id": "map_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MapEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MetricEntity

```python
metric = client.metric
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.metric.load({"id": "metric_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MetricEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MobEntity

```python
mob = client.mob
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.mob.load({"id": "mob_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MobEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MusicEntity

```python
music = client.music
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.music.load({"id": "music_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MusicEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## NameEntity

```python
name = client.name
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.name.load({"id": "name_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `NameEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## NpcEntity

```python
npc = client.npc
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.npc.load({"id": "npc_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `NpcEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## NxfEntity

```python
nxf = client.nxf
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.nxf.load({"id": "nxf_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `NxfEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PerformanceMetricEntity

```python
performance_metric = client.performance_metric
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `active_request` | ``$INTEGER`` | No |  |
| `average_response_time_m` | ``$NUMBER`` | No |  |
| `cache` | ``$OBJECT`` | No |  |
| `errors_by_type` | ``$OBJECT`` | No |  |
| `last_updated` | ``$STRING`` | No |  |
| `memory_used_byte` | ``$INTEGER`` | No |  |
| `redis_cache` | ``$OBJECT`` | No |  |
| `requests_per_second` | ``$NUMBER`` | No |  |
| `start_time` | ``$STRING`` | No |  |
| `system` | ``$OBJECT`` | No |  |
| `total_error` | ``$INTEGER`` | No |  |
| `total_request` | ``$INTEGER`` | No |  |
| `wz_properties_loaded` | ``$INTEGER`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.performance_metric.load({"id": "performance_metric_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PerformanceMetricEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PetEntity

```python
pet = client.pet
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.pet.load({"id": "pet_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PetEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## QuestEntity

```python
quest = client.quest
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.quest.load({"id": "quest_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `QuestEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SystemEntity

```python
system = client.system
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cpu_usage_percent` | ``$NUMBER`` | No |  |
| `gc_gen0_collection` | ``$INTEGER`` | No |  |
| `gc_gen1_collection` | ``$INTEGER`` | No |  |
| `gc_gen2_collection` | ``$INTEGER`` | No |  |
| `thread_count` | ``$INTEGER`` | No |  |
| `total_memory_byte` | ``$INTEGER`` | No |  |
| `used_memory_byte` | ``$INTEGER`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.system.load({"id": "system_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SystemEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TipEntity

```python
tip = client.tip
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.tip.load({"id": "tip_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TipEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## WznEntity

```python
wzn = client.wzn
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.wzn.load({"id": "wzn_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WznEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Wzn2Entity

```python
wzn2 = client.wzn2
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.wzn2.load({"id": "wzn2_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn2Entity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Wzn3Entity

```python
wzn3 = client.wzn3
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.wzn3.load({"id": "wzn3_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn3Entity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Wzn4Entity

```python
wzn4 = client.wzn4
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.wzn4.load({"id": "wzn4_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn4Entity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Wzn5Entity

```python
wzn5 = client.wzn5
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.wzn5.load({"id": "wzn5_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn5Entity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Wzn6Entity

```python
wzn6 = client.wzn6
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.wzn6.load({"id": "wzn6_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn6Entity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ZMapEntity

```python
z_map = client.z_map
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.z_map.load({"id": "z_map_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ZMapEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = MaplestorySDK({
    "feature": {
        "test": {"active": True},
    },
})
```

