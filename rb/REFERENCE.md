# Maplestory Ruby SDK Reference

Complete API reference for the Maplestory Ruby SDK.


## MaplestorySDK

### Constructor

```ruby
require_relative 'maplestory_sdk'

client = MaplestorySDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `MaplestorySDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = MaplestorySDK.test
```


### Instance Methods

#### `Android(data = nil)`

Create a new `Android` entity instance. Pass `nil` for no initial data.

#### `Avatar(data = nil)`

Create a new `Avatar` entity instance. Pass `nil` for no initial data.

#### `Cache(data = nil)`

Create a new `Cache` entity instance. Pass `nil` for no initial data.

#### `Character(data = nil)`

Create a new `Character` entity instance. Pass `nil` for no initial data.

#### `Chat(data = nil)`

Create a new `Chat` entity instance. Pass `nil` for no initial data.

#### `Cluster(data = nil)`

Create a new `Cluster` entity instance. Pass `nil` for no initial data.

#### `Diff(data = nil)`

Create a new `Diff` entity instance. Pass `nil` for no initial data.

#### `Entity1(data = nil)`

Create a new `Entity1` entity instance. Pass `nil` for no initial data.

#### `GmsNew(data = nil)`

Create a new `GmsNew` entity instance. Pass `nil` for no initial data.

#### `GuildMark(data = nil)`

Create a new `GuildMark` entity instance. Pass `nil` for no initial data.

#### `Health(data = nil)`

Create a new `Health` entity instance. Pass `nil` for no initial data.

#### `Item(data = nil)`

Create a new `Item` entity instance. Pass `nil` for no initial data.

#### `Job(data = nil)`

Create a new `Job` entity instance. Pass `nil` for no initial data.

#### `Map(data = nil)`

Create a new `Map` entity instance. Pass `nil` for no initial data.

#### `Metric(data = nil)`

Create a new `Metric` entity instance. Pass `nil` for no initial data.

#### `Mob(data = nil)`

Create a new `Mob` entity instance. Pass `nil` for no initial data.

#### `Music(data = nil)`

Create a new `Music` entity instance. Pass `nil` for no initial data.

#### `Name(data = nil)`

Create a new `Name` entity instance. Pass `nil` for no initial data.

#### `Npc(data = nil)`

Create a new `Npc` entity instance. Pass `nil` for no initial data.

#### `Nxf(data = nil)`

Create a new `Nxf` entity instance. Pass `nil` for no initial data.

#### `PerformanceMetric(data = nil)`

Create a new `PerformanceMetric` entity instance. Pass `nil` for no initial data.

#### `Pet(data = nil)`

Create a new `Pet` entity instance. Pass `nil` for no initial data.

#### `Quest(data = nil)`

Create a new `Quest` entity instance. Pass `nil` for no initial data.

#### `System(data = nil)`

Create a new `System` entity instance. Pass `nil` for no initial data.

#### `Tip(data = nil)`

Create a new `Tip` entity instance. Pass `nil` for no initial data.

#### `Wzn(data = nil)`

Create a new `Wzn` entity instance. Pass `nil` for no initial data.

#### `Wzn2(data = nil)`

Create a new `Wzn2` entity instance. Pass `nil` for no initial data.

#### `Wzn3(data = nil)`

Create a new `Wzn3` entity instance. Pass `nil` for no initial data.

#### `Wzn4(data = nil)`

Create a new `Wzn4` entity instance. Pass `nil` for no initial data.

#### `Wzn5(data = nil)`

Create a new `Wzn5` entity instance. Pass `nil` for no initial data.

#### `Wzn6(data = nil)`

Create a new `Wzn6` entity instance. Pass `nil` for no initial data.

#### `ZMap(data = nil)`

Create a new `ZMap` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## AndroidEntity

```ruby
android = client.android
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.android.load({ "id" => "android_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `AndroidEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## AvatarEntity

```ruby
avatar = client.avatar
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.avatar.load({ "id" => "avatar_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `AvatarEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## CacheEntity

```ruby
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

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.cache.load({ "id" => "cache_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CacheEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## CharacterEntity

```ruby
character = client.character
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.character.load({ "id" => "character_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CharacterEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ChatEntity

```ruby
chat = client.chat
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.chat.load({ "id" => "chat_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ChatEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ClusterEntity

```ruby
cluster = client.cluster
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hostname` | ``$STRING`` | No |  |
| `last_seen` | ``$STRING`` | No |  |
| `metric` | ``$OBJECT`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.cluster.list(nil)
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ClusterEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DiffEntity

```ruby
diff = client.diff
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.diff.load({ "id" => "diff_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DiffEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Entity1Entity

```ruby
entity1 = client.entity1
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.entity1.load({ "id" => "entity1_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `Entity1Entity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## GmsNewEntity

```ruby
gms_new = client.gms_new
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.gms_new.load({ "id" => "gms_new_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `GmsNewEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## GuildMarkEntity

```ruby
guild_mark = client.guild_mark
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.guild_mark.load({ "id" => "guild_mark_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `GuildMarkEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## HealthEntity

```ruby
health = client.health
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.health.load({ "id" => "health_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `HealthEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ItemEntity

```ruby
item = client.item
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.item.load({ "id" => "item_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ItemEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## JobEntity

```ruby
job = client.job
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.job.load({ "id" => "job_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `JobEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MapEntity

```ruby
map = client.map
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.map.load({ "id" => "map_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MapEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MetricEntity

```ruby
metric = client.metric
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.metric.load({ "id" => "metric_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MetricEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MobEntity

```ruby
mob = client.mob
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.mob.load({ "id" => "mob_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MobEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MusicEntity

```ruby
music = client.music
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.music.load({ "id" => "music_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MusicEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## NameEntity

```ruby
name = client.name
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.name.load({ "id" => "name_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `NameEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## NpcEntity

```ruby
npc = client.npc
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.npc.load({ "id" => "npc_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `NpcEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## NxfEntity

```ruby
nxf = client.nxf
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.nxf.load({ "id" => "nxf_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `NxfEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PerformanceMetricEntity

```ruby
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

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.performance_metric.load({ "id" => "performance_metric_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PerformanceMetricEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PetEntity

```ruby
pet = client.pet
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.pet.load({ "id" => "pet_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PetEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## QuestEntity

```ruby
quest = client.quest
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.quest.load({ "id" => "quest_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `QuestEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## SystemEntity

```ruby
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

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.system.load({ "id" => "system_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `SystemEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TipEntity

```ruby
tip = client.tip
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.tip.load({ "id" => "tip_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TipEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## WznEntity

```ruby
wzn = client.wzn
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.wzn.load({ "id" => "wzn_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `WznEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Wzn2Entity

```ruby
wzn2 = client.wzn2
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.wzn2.load({ "id" => "wzn2_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `Wzn2Entity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Wzn3Entity

```ruby
wzn3 = client.wzn3
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.wzn3.load({ "id" => "wzn3_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `Wzn3Entity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Wzn4Entity

```ruby
wzn4 = client.wzn4
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.wzn4.load({ "id" => "wzn4_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `Wzn4Entity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Wzn5Entity

```ruby
wzn5 = client.wzn5
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.wzn5.load({ "id" => "wzn5_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `Wzn5Entity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Wzn6Entity

```ruby
wzn6 = client.wzn6
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.wzn6.load({ "id" => "wzn6_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `Wzn6Entity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ZMapEntity

```ruby
z_map = client.z_map
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.z_map.load({ "id" => "z_map_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ZMapEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = MaplestorySDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

