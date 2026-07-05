# Maplestory Golang SDK Reference

Complete API reference for the Maplestory Golang SDK.


## MaplestorySDK

### Constructor

```go
func NewMaplestorySDK(options map[string]any) *MaplestorySDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *MaplestorySDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *MaplestorySDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Android(data map[string]any) MaplestoryEntity`

Create a new `Android` entity instance. Pass `nil` for no initial data.

#### `Avatar(data map[string]any) MaplestoryEntity`

Create a new `Avatar` entity instance. Pass `nil` for no initial data.

#### `Cache(data map[string]any) MaplestoryEntity`

Create a new `Cache` entity instance. Pass `nil` for no initial data.

#### `Character(data map[string]any) MaplestoryEntity`

Create a new `Character` entity instance. Pass `nil` for no initial data.

#### `Chat(data map[string]any) MaplestoryEntity`

Create a new `Chat` entity instance. Pass `nil` for no initial data.

#### `Cluster(data map[string]any) MaplestoryEntity`

Create a new `Cluster` entity instance. Pass `nil` for no initial data.

#### `Diff(data map[string]any) MaplestoryEntity`

Create a new `Diff` entity instance. Pass `nil` for no initial data.

#### `Entity1(data map[string]any) MaplestoryEntity`

Create a new `Entity1` entity instance. Pass `nil` for no initial data.

#### `GmsNew(data map[string]any) MaplestoryEntity`

Create a new `GmsNew` entity instance. Pass `nil` for no initial data.

#### `GuildMark(data map[string]any) MaplestoryEntity`

Create a new `GuildMark` entity instance. Pass `nil` for no initial data.

#### `Health(data map[string]any) MaplestoryEntity`

Create a new `Health` entity instance. Pass `nil` for no initial data.

#### `Item(data map[string]any) MaplestoryEntity`

Create a new `Item` entity instance. Pass `nil` for no initial data.

#### `Job(data map[string]any) MaplestoryEntity`

Create a new `Job` entity instance. Pass `nil` for no initial data.

#### `Map(data map[string]any) MaplestoryEntity`

Create a new `Map` entity instance. Pass `nil` for no initial data.

#### `Metric(data map[string]any) MaplestoryEntity`

Create a new `Metric` entity instance. Pass `nil` for no initial data.

#### `Mob(data map[string]any) MaplestoryEntity`

Create a new `Mob` entity instance. Pass `nil` for no initial data.

#### `Music(data map[string]any) MaplestoryEntity`

Create a new `Music` entity instance. Pass `nil` for no initial data.

#### `Name(data map[string]any) MaplestoryEntity`

Create a new `Name` entity instance. Pass `nil` for no initial data.

#### `Npc(data map[string]any) MaplestoryEntity`

Create a new `Npc` entity instance. Pass `nil` for no initial data.

#### `Nxf(data map[string]any) MaplestoryEntity`

Create a new `Nxf` entity instance. Pass `nil` for no initial data.

#### `PerformanceMetric(data map[string]any) MaplestoryEntity`

Create a new `PerformanceMetric` entity instance. Pass `nil` for no initial data.

#### `Pet(data map[string]any) MaplestoryEntity`

Create a new `Pet` entity instance. Pass `nil` for no initial data.

#### `Quest(data map[string]any) MaplestoryEntity`

Create a new `Quest` entity instance. Pass `nil` for no initial data.

#### `System(data map[string]any) MaplestoryEntity`

Create a new `System` entity instance. Pass `nil` for no initial data.

#### `Tip(data map[string]any) MaplestoryEntity`

Create a new `Tip` entity instance. Pass `nil` for no initial data.

#### `Wzn(data map[string]any) MaplestoryEntity`

Create a new `Wzn` entity instance. Pass `nil` for no initial data.

#### `Wzn2(data map[string]any) MaplestoryEntity`

Create a new `Wzn2` entity instance. Pass `nil` for no initial data.

#### `Wzn3(data map[string]any) MaplestoryEntity`

Create a new `Wzn3` entity instance. Pass `nil` for no initial data.

#### `Wzn4(data map[string]any) MaplestoryEntity`

Create a new `Wzn4` entity instance. Pass `nil` for no initial data.

#### `Wzn5(data map[string]any) MaplestoryEntity`

Create a new `Wzn5` entity instance. Pass `nil` for no initial data.

#### `Wzn6(data map[string]any) MaplestoryEntity`

Create a new `Wzn6` entity instance. Pass `nil` for no initial data.

#### `ZMap(data map[string]any) MaplestoryEntity`

Create a new `ZMap` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## AndroidEntity

```go
android := client.Android(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Android(nil).Load(map[string]any{"id": "android_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AndroidEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## AvatarEntity

```go
avatar := client.Avatar(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Avatar(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AvatarEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## CacheEntity

```go
cache := client.Cache(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `eviction_count` | `int` | No |  |
| `hit_count` | `int` | No |  |
| `hit_ratio` | `float64` | No |  |
| `memory_usage` | `int` | No |  |
| `miss_count` | `int` | No |  |
| `total_entry` | `int` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Cache(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CacheEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## CharacterEntity

```go
character := client.Character(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Character(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CharacterEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ChatEntity

```go
chat := client.Chat(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Chat(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ChatEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ClusterEntity

```go
cluster := client.Cluster(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hostname` | `string` | No |  |
| `last_seen` | `string` | No |  |
| `metric` | `map[string]any` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Cluster(nil).List(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ClusterEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DiffEntity

```go
diff := client.Diff(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Diff(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DiffEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Entity1Entity

```go
entity1 := client.Entity1(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Entity1(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `Entity1Entity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## GmsNewEntity

```go
gms_new := client.GmsNew(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.GmsNew(nil).Load(map[string]any{"id": "gms_new_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `GmsNewEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## GuildMarkEntity

```go
guild_mark := client.GuildMark(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.GuildMark(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `GuildMarkEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## HealthEntity

```go
health := client.Health(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Health(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `HealthEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ItemEntity

```go
item := client.Item(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Item(nil).Load(map[string]any{"id": "item_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ItemEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## JobEntity

```go
job := client.Job(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Job(nil).Load(map[string]any{"id": "job_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `JobEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MapEntity

```go
map := client.Map(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Map(nil).Load(map[string]any{"id": "map_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MapEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MetricEntity

```go
metric := client.Metric(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Metric(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MetricEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MobEntity

```go
mob := client.Mob(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Mob(nil).Load(map[string]any{"id": "mob_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MobEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MusicEntity

```go
music := client.Music(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Music(nil).Load(map[string]any{"id": "music_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MusicEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## NameEntity

```go
name := client.Name(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Name(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `NameEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## NpcEntity

```go
npc := client.Npc(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Npc(nil).Load(map[string]any{"id": "npc_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `NpcEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## NxfEntity

```go
nxf := client.Nxf(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Nxf(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `NxfEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PerformanceMetricEntity

```go
performance_metric := client.PerformanceMetric(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `active_request` | `int` | No |  |
| `average_response_time_m` | `float64` | No |  |
| `cache` | `map[string]any` | No |  |
| `errors_by_type` | `map[string]any` | No |  |
| `last_updated` | `string` | No |  |
| `memory_used_byte` | `int` | No |  |
| `redis_cache` | `map[string]any` | No |  |
| `requests_per_second` | `float64` | No |  |
| `start_time` | `string` | No |  |
| `system` | `map[string]any` | No |  |
| `total_error` | `int` | No |  |
| `total_request` | `int` | No |  |
| `wz_properties_loaded` | `int` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.PerformanceMetric(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PerformanceMetricEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PetEntity

```go
pet := client.Pet(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Pet(nil).Load(map[string]any{"id": "pet_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PetEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## QuestEntity

```go
quest := client.Quest(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Quest(nil).Load(map[string]any{"id": "quest_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `QuestEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SystemEntity

```go
system := client.System(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cpu_usage_percent` | `float64` | No |  |
| `gc_gen0_collection` | `int` | No |  |
| `gc_gen1_collection` | `int` | No |  |
| `gc_gen2_collection` | `int` | No |  |
| `thread_count` | `int` | No |  |
| `total_memory_byte` | `int` | No |  |
| `used_memory_byte` | `int` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.System(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SystemEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TipEntity

```go
tip := client.Tip(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Tip(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TipEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## WznEntity

```go
wzn := client.Wzn(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Wzn(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `WznEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Wzn2Entity

```go
wzn2 := client.Wzn2(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Wzn2(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `Wzn2Entity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Wzn3Entity

```go
wzn3 := client.Wzn3(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Wzn3(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `Wzn3Entity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Wzn4Entity

```go
wzn4 := client.Wzn4(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Wzn4(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `Wzn4Entity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Wzn5Entity

```go
wzn5 := client.Wzn5(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Wzn5(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `Wzn5Entity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Wzn6Entity

```go
wzn6 := client.Wzn6(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Wzn6(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `Wzn6Entity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ZMapEntity

```go
z_map := client.ZMap(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.ZMap(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ZMapEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewMaplestorySDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

