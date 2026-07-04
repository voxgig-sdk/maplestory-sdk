# Maplestory Lua SDK Reference

Complete API reference for the Maplestory Lua SDK.


## MaplestorySDK

### Constructor

```lua
local sdk = require("maplestory_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Android(data)`

Create a new `Android` entity instance. Pass `nil` for no initial data.

#### `Avatar(data)`

Create a new `Avatar` entity instance. Pass `nil` for no initial data.

#### `Cache(data)`

Create a new `Cache` entity instance. Pass `nil` for no initial data.

#### `Character(data)`

Create a new `Character` entity instance. Pass `nil` for no initial data.

#### `Chat(data)`

Create a new `Chat` entity instance. Pass `nil` for no initial data.

#### `Cluster(data)`

Create a new `Cluster` entity instance. Pass `nil` for no initial data.

#### `Diff(data)`

Create a new `Diff` entity instance. Pass `nil` for no initial data.

#### `Entity1(data)`

Create a new `Entity1` entity instance. Pass `nil` for no initial data.

#### `GmsNew(data)`

Create a new `GmsNew` entity instance. Pass `nil` for no initial data.

#### `GuildMark(data)`

Create a new `GuildMark` entity instance. Pass `nil` for no initial data.

#### `Health(data)`

Create a new `Health` entity instance. Pass `nil` for no initial data.

#### `Item(data)`

Create a new `Item` entity instance. Pass `nil` for no initial data.

#### `Job(data)`

Create a new `Job` entity instance. Pass `nil` for no initial data.

#### `Map(data)`

Create a new `Map` entity instance. Pass `nil` for no initial data.

#### `Metric(data)`

Create a new `Metric` entity instance. Pass `nil` for no initial data.

#### `Mob(data)`

Create a new `Mob` entity instance. Pass `nil` for no initial data.

#### `Music(data)`

Create a new `Music` entity instance. Pass `nil` for no initial data.

#### `Name(data)`

Create a new `Name` entity instance. Pass `nil` for no initial data.

#### `Npc(data)`

Create a new `Npc` entity instance. Pass `nil` for no initial data.

#### `Nxf(data)`

Create a new `Nxf` entity instance. Pass `nil` for no initial data.

#### `PerformanceMetric(data)`

Create a new `PerformanceMetric` entity instance. Pass `nil` for no initial data.

#### `Pet(data)`

Create a new `Pet` entity instance. Pass `nil` for no initial data.

#### `Quest(data)`

Create a new `Quest` entity instance. Pass `nil` for no initial data.

#### `System(data)`

Create a new `System` entity instance. Pass `nil` for no initial data.

#### `Tip(data)`

Create a new `Tip` entity instance. Pass `nil` for no initial data.

#### `Wzn(data)`

Create a new `Wzn` entity instance. Pass `nil` for no initial data.

#### `Wzn2(data)`

Create a new `Wzn2` entity instance. Pass `nil` for no initial data.

#### `Wzn3(data)`

Create a new `Wzn3` entity instance. Pass `nil` for no initial data.

#### `Wzn4(data)`

Create a new `Wzn4` entity instance. Pass `nil` for no initial data.

#### `Wzn5(data)`

Create a new `Wzn5` entity instance. Pass `nil` for no initial data.

#### `Wzn6(data)`

Create a new `Wzn6` entity instance. Pass `nil` for no initial data.

#### `ZMap(data)`

Create a new `ZMap` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## AndroidEntity

```lua
local android = client:android(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:android():load({ id = "android_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AndroidEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## AvatarEntity

```lua
local avatar = client:avatar(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:avatar():load({ id = "avatar_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AvatarEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## CacheEntity

```lua
local cache = client:cache(nil)
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

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:cache():load({ id = "cache_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CacheEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## CharacterEntity

```lua
local character = client:character(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:character():load({ id = "character_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CharacterEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ChatEntity

```lua
local chat = client:chat(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:chat():load({ id = "chat_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ChatEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ClusterEntity

```lua
local cluster = client:cluster(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hostname` | ``$STRING`` | No |  |
| `last_seen` | ``$STRING`` | No |  |
| `metric` | ``$OBJECT`` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:cluster():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ClusterEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DiffEntity

```lua
local diff = client:diff(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:diff():load({ id = "diff_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DiffEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Entity1Entity

```lua
local entity1 = client:entity1(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:entity1():load({ id = "entity1_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Entity1Entity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## GmsNewEntity

```lua
local gms_new = client:gms_new(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:gms_new():load({ id = "gms_new_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GmsNewEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## GuildMarkEntity

```lua
local guild_mark = client:guild_mark(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:guild_mark():load({ id = "guild_mark_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GuildMarkEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## HealthEntity

```lua
local health = client:health(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:health():load({ id = "health_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HealthEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ItemEntity

```lua
local item = client:item(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:item():load({ id = "item_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ItemEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## JobEntity

```lua
local job = client:job(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:job():load({ id = "job_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `JobEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MapEntity

```lua
local map = client:map(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:map():load({ id = "map_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MapEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MetricEntity

```lua
local metric = client:metric(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:metric():load({ id = "metric_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MetricEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MobEntity

```lua
local mob = client:mob(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:mob():load({ id = "mob_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MobEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MusicEntity

```lua
local music = client:music(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:music():load({ id = "music_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MusicEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## NameEntity

```lua
local name = client:name(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:name():load({ id = "name_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `NameEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## NpcEntity

```lua
local npc = client:npc(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:npc():load({ id = "npc_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `NpcEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## NxfEntity

```lua
local nxf = client:nxf(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:nxf():load({ id = "nxf_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `NxfEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PerformanceMetricEntity

```lua
local performance_metric = client:performance_metric(nil)
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

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:performance_metric():load({ id = "performance_metric_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PerformanceMetricEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PetEntity

```lua
local pet = client:pet(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:pet():load({ id = "pet_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PetEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## QuestEntity

```lua
local quest = client:quest(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:quest():load({ id = "quest_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `QuestEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SystemEntity

```lua
local system = client:system(nil)
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

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:system():load({ id = "system_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SystemEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TipEntity

```lua
local tip = client:tip(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:tip():load({ id = "tip_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TipEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## WznEntity

```lua
local wzn = client:wzn(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:wzn():load({ id = "wzn_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WznEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Wzn2Entity

```lua
local wzn2 = client:wzn2(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:wzn2():load({ id = "wzn2_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn2Entity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Wzn3Entity

```lua
local wzn3 = client:wzn3(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:wzn3():load({ id = "wzn3_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn3Entity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Wzn4Entity

```lua
local wzn4 = client:wzn4(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:wzn4():load({ id = "wzn4_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn4Entity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Wzn5Entity

```lua
local wzn5 = client:wzn5(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:wzn5():load({ id = "wzn5_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn5Entity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Wzn6Entity

```lua
local wzn6 = client:wzn6(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:wzn6():load({ id = "wzn6_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `Wzn6Entity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ZMapEntity

```lua
local z_map = client:z_map(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:z_map():load({ id = "z_map_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ZMapEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

