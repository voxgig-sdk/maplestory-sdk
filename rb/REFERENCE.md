# Maplestory Ruby SDK Reference

Complete API reference for the Maplestory Ruby SDK.


## MaplestorySDK

### Constructor

```ruby
require_relative 'Maplestory_sdk'

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
android = client.Android
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Android.load({ "id" => 1, "region" => "region", "version" => "version" })
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
avatar = client.Avatar
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Avatar.load({ "animation" => "animation", "frame" => 1 })
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
cache = client.Cache
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `eviction_count` | `Integer` | No |  |
| `hit_count` | `Integer` | No |  |
| `hit_ratio` | `Float` | No |  |
| `memory_usage` | `Integer` | No |  |
| `miss_count` | `Integer` | No |  |
| `total_entry` | `Integer` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Cache.load()
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
character = client.Character
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Character.load({ "region" => "region", "version" => "version" })
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
chat = client.Chat
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Chat.load({ "region" => "region", "version" => "version" })
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
cluster = client.Cluster
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hostname` | `String` | No |  |
| `last_seen` | `String` | No |  |
| `metric` | `Hash` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Cluster.list
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
diff = client.Diff
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Diff.load({ "region" => "region", "version" => "version" })
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
entity1 = client.Entity1
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Entity1.load()
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
gms_new = client.GmsNew
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.GmsNew.load({ "id" => 1 })
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
guild_mark = client.GuildMark
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.GuildMark.load({ "guild_mark_id" => 1, "region" => "region", "version" => "version" })
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
health = client.Health
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Health.load()
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
item = client.Item
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Item.load({ "id" => 1, "region" => "region", "version" => "version" })
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
job = client.Job
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Job.load({ "id" => 1, "region" => "region", "version" => "version" })
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
map = client.Map
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Map.load({ "id" => 1, "region" => "region", "version" => "version" })
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
metric = client.Metric
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Metric.load()
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
mob = client.Mob
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Mob.load({ "id" => 1, "region" => "region", "version" => "version" })
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
music = client.Music
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Music.load({ "id" => "music_id", "region" => "region", "version" => "version" })
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
name = client.Name
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Name.load({ "region" => "region", "version" => "version" })
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
npc = client.Npc
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Npc.load({ "id" => 1, "region" => "region", "version" => "version" })
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
nxf = client.Nxf
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Nxf.load()
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
performance_metric = client.PerformanceMetric
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `active_request` | `Integer` | No |  |
| `average_response_time_m` | `Float` | No |  |
| `cache` | `Hash` | No |  |
| `errors_by_type` | `Hash` | No |  |
| `last_updated` | `String` | No |  |
| `memory_used_byte` | `Integer` | No |  |
| `redis_cache` | `Hash` | No |  |
| `requests_per_second` | `Float` | No |  |
| `start_time` | `String` | No |  |
| `system` | `Hash` | No |  |
| `total_error` | `Integer` | No |  |
| `total_request` | `Integer` | No |  |
| `wz_properties_loaded` | `Integer` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.PerformanceMetric.load()
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
pet = client.Pet
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Pet.load({ "id" => 1, "region" => "region", "version" => "version" })
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
quest = client.Quest
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Quest.load({ "id" => 1, "region" => "region", "version" => "version" })
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
system = client.System
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cpu_usage_percent` | `Float` | No |  |
| `gc_gen0_collection` | `Integer` | No |  |
| `gc_gen1_collection` | `Integer` | No |  |
| `gc_gen2_collection` | `Integer` | No |  |
| `thread_count` | `Integer` | No |  |
| `total_memory_byte` | `Integer` | No |  |
| `used_memory_byte` | `Integer` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.System.load()
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
tip = client.Tip
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Tip.load({ "region" => "region", "version" => "version" })
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
wzn = client.Wzn
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Wzn.load({ "region" => "region", "version" => "version" })
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
wzn2 = client.Wzn2
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Wzn2.load({ "path" => "path", "region" => "region", "version" => "version" })
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
wzn3 = client.Wzn3
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Wzn3.load({ "path" => "path", "region" => "region", "version" => "version" })
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
wzn4 = client.Wzn4
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Wzn4.load({ "path" => "path", "region" => "region", "version" => "version" })
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
wzn5 = client.Wzn5
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Wzn5.load({ "path" => "path", "region" => "region", "version" => "version" })
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
wzn6 = client.Wzn6
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Wzn6.load({ "path" => "path", "region" => "region", "version" => "version" })
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
z_map = client.ZMap
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.ZMap.load({ "region" => "region", "version" => "version" })
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

