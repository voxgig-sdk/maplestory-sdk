# Maplestory Lua SDK



The Lua SDK for the Maplestory API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:Android()` — each with the same small set of operations (`list`, `load`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/maplestory-sdk/releases)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```lua
local sdk = require("maplestory_sdk")

local client = sdk.new()
```

### 3. Load an android

```lua
local android, err = client:Android():load({ id = "example_id" })
if err then error(err) end
print(android)
```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local android, err = client:Android():load({ id = 1 })
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:Android():load({ id = "test01" })
-- result is the returned data; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
MAPLESTORY_TEST_LIVE=TRUE
```

Then run:

```bash
cd lua && busted test/
```


## Reference

### MaplestorySDK

```lua
local sdk = require("maplestory_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### MaplestorySDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
| `Android` | `(data) -> AndroidEntity` | Create an Android entity instance. |
| `Avatar` | `(data) -> AvatarEntity` | Create an Avatar entity instance. |
| `Cache` | `(data) -> CacheEntity` | Create a Cache entity instance. |
| `Character` | `(data) -> CharacterEntity` | Create a Character entity instance. |
| `Chat` | `(data) -> ChatEntity` | Create a Chat entity instance. |
| `Cluster` | `(data) -> ClusterEntity` | Create a Cluster entity instance. |
| `Diff` | `(data) -> DiffEntity` | Create a Diff entity instance. |
| `Entity1` | `(data) -> Entity1Entity` | Create an Entity1 entity instance. |
| `GmsNew` | `(data) -> GmsNewEntity` | Create a GmsNew entity instance. |
| `GuildMark` | `(data) -> GuildMarkEntity` | Create a GuildMark entity instance. |
| `Health` | `(data) -> HealthEntity` | Create a Health entity instance. |
| `Item` | `(data) -> ItemEntity` | Create an Item entity instance. |
| `Job` | `(data) -> JobEntity` | Create a Job entity instance. |
| `Map` | `(data) -> MapEntity` | Create a Map entity instance. |
| `Metric` | `(data) -> MetricEntity` | Create a Metric entity instance. |
| `Mob` | `(data) -> MobEntity` | Create a Mob entity instance. |
| `Music` | `(data) -> MusicEntity` | Create a Music entity instance. |
| `Name` | `(data) -> NameEntity` | Create a Name entity instance. |
| `Npc` | `(data) -> NpcEntity` | Create a Npc entity instance. |
| `Nxf` | `(data) -> NxfEntity` | Create a Nxf entity instance. |
| `PerformanceMetric` | `(data) -> PerformanceMetricEntity` | Create a PerformanceMetric entity instance. |
| `Pet` | `(data) -> PetEntity` | Create a Pet entity instance. |
| `Quest` | `(data) -> QuestEntity` | Create a Quest entity instance. |
| `System` | `(data) -> SystemEntity` | Create a System entity instance. |
| `Tip` | `(data) -> TipEntity` | Create a Tip entity instance. |
| `Wzn` | `(data) -> WznEntity` | Create a Wzn entity instance. |
| `Wzn2` | `(data) -> Wzn2Entity` | Create a Wzn2 entity instance. |
| `Wzn3` | `(data) -> Wzn3Entity` | Create a Wzn3 entity instance. |
| `Wzn4` | `(data) -> Wzn4Entity` | Create a Wzn4 entity instance. |
| `Wzn5` | `(data) -> Wzn5Entity` | Create a Wzn5 entity instance. |
| `Wzn6` | `(data) -> Wzn6Entity` | Create a Wzn6 entity instance. |
| `ZMap` | `(data) -> ZMapEntity` | Create a ZMap entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any, err` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> any, err` | List entities matching the criteria. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the operation's
data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `load` | the entity record (a `table`) |
| `list` | an array (`table`) of entity records |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local android, err = client:Android():load({ id = "example_id" })
    if err then error(err) end
    -- android is the loaded record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

### Entities

#### Android

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/android/{androidId}`

#### Avatar

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/character/{items}/{animation}/animated`

#### Cache

| Field | Description |
| --- | --- |
| `eviction_count` |  |
| `hit_count` |  |
| `hit_ratio` |  |
| `memory_usage` |  |
| `miss_count` |  |
| `total_entry` |  |

Operations: Load.

API path: `/api/metrics/cache`

#### Character

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/Character/animated/{skinId}/{items}/{animation}/{frame}`

#### Chat

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/chat`

#### Cluster

| Field | Description |
| --- | --- |
| `hostname` |  |
| `last_seen` |  |
| `metric` |  |

Operations: List.

API path: `/api/metrics/cluster`

#### Diff

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/diff`

#### Entity1

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/`

#### GmsNew

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/gms/latest/news/article/{id}`

#### GuildMark

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/GuildMark/background/{guildBackgroundId}/{guildBackgroundColorId}/mark/{guildMarkId}/{guildMarkColorId}`

#### Health

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/health/alive`

#### Item

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/item`

#### Job

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/job/{jobId}/skillbook/{skillId}`

#### Map

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/map/{mapId}/render/layer/{layer}/{frame}`

#### Metric

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/metrics/health`

#### Mob

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/mob`

#### Music

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/music/{songPath}`

#### Name

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/name`

#### Npc

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/npc/{npcId}/render/animated/{framebook}`

#### Nxf

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/about`

#### PerformanceMetric

| Field | Description |
| --- | --- |
| `active_request` |  |
| `average_response_time_m` |  |
| `cache` |  |
| `errors_by_type` |  |
| `last_updated` |  |
| `memory_used_byte` |  |
| `redis_cache` |  |
| `requests_per_second` |  |
| `start_time` |  |
| `system` |  |
| `total_error` |  |
| `total_request` |  |
| `wz_properties_loaded` |  |

Operations: Load.

API path: `/api/metrics`

#### Pet

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/pet/{petId}/render/{animation}/{frame}/{petEquip}`

#### Quest

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/quest`

#### System

| Field | Description |
| --- | --- |
| `cpu_usage_percent` |  |
| `gc_gen0_collection` |  |
| `gc_gen1_collection` |  |
| `gc_gen2_collection` |  |
| `thread_count` |  |
| `total_memory_byte` |  |
| `used_memory_byte` |  |

Operations: Load.

API path: `/api/metrics/system`

#### Tip

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/tips`

#### Wzn

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/wz`

#### Wzn2

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/wz/audio/{region}/{version}/{path}`

#### Wzn3

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/wz/export/{region}/{version}/{path}`

#### Wzn4

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/wz/img/{region}/{version}/{path}`

#### Wzn5

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/wz/lookup/{region}/{version}/{path}`

#### Wzn6

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/wz/{region}/{version}/{path}`

#### ZMap

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/{region}/{version}/zmap`



## Entities


### Android

Create an instance: `local android = client:Android(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local android, err = client:Android():load({ id = "android_id" })
```


### Avatar

Create an instance: `local avatar = client:Avatar(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local avatar, err = client:Avatar():load()
```


### Cache

Create an instance: `local cache = client:Cache(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `eviction_count` | `number` |  |
| `hit_count` | `number` |  |
| `hit_ratio` | `number` |  |
| `memory_usage` | `number` |  |
| `miss_count` | `number` |  |
| `total_entry` | `number` |  |

#### Example: Load

```lua
local cache, err = client:Cache():load()
```


### Character

Create an instance: `local character = client:Character(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local character, err = client:Character():load()
```


### Chat

Create an instance: `local chat = client:Chat(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local chat, err = client:Chat():load()
```


### Cluster

Create an instance: `local cluster = client:Cluster(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `hostname` | `string` |  |
| `last_seen` | `string` |  |
| `metric` | `table` |  |

#### Example: List

```lua
local clusters, err = client:Cluster():list()
```


### Diff

Create an instance: `local diff = client:Diff(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local diff, err = client:Diff():load()
```


### Entity1

Create an instance: `local entity1 = client:Entity1(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local entity1, err = client:Entity1():load()
```


### GmsNew

Create an instance: `local gms_new = client:GmsNew(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local gms_new, err = client:GmsNew():load({ id = "gms_new_id" })
```


### GuildMark

Create an instance: `local guild_mark = client:GuildMark(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local guild_mark, err = client:GuildMark():load()
```


### Health

Create an instance: `local health = client:Health(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local health, err = client:Health():load()
```


### Item

Create an instance: `local item = client:Item(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local item, err = client:Item():load({ id = "item_id" })
```


### Job

Create an instance: `local job = client:Job(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local job, err = client:Job():load({ id = "job_id" })
```


### Map

Create an instance: `local map = client:Map(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local map, err = client:Map():load({ id = "map_id" })
```


### Metric

Create an instance: `local metric = client:Metric(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local metric, err = client:Metric():load()
```


### Mob

Create an instance: `local mob = client:Mob(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local mob, err = client:Mob():load({ id = "mob_id" })
```


### Music

Create an instance: `local music = client:Music(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local music, err = client:Music():load({ id = "music_id" })
```


### Name

Create an instance: `local name = client:Name(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local name, err = client:Name():load()
```


### Npc

Create an instance: `local npc = client:Npc(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local npc, err = client:Npc():load({ id = "npc_id" })
```


### Nxf

Create an instance: `local nxf = client:Nxf(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local nxf, err = client:Nxf():load()
```


### PerformanceMetric

Create an instance: `local performance_metric = client:PerformanceMetric(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `active_request` | `number` |  |
| `average_response_time_m` | `number` |  |
| `cache` | `table` |  |
| `errors_by_type` | `table` |  |
| `last_updated` | `string` |  |
| `memory_used_byte` | `number` |  |
| `redis_cache` | `table` |  |
| `requests_per_second` | `number` |  |
| `start_time` | `string` |  |
| `system` | `table` |  |
| `total_error` | `number` |  |
| `total_request` | `number` |  |
| `wz_properties_loaded` | `number` |  |

#### Example: Load

```lua
local performance_metric, err = client:PerformanceMetric():load()
```


### Pet

Create an instance: `local pet = client:Pet(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local pet, err = client:Pet():load({ id = "pet_id" })
```


### Quest

Create an instance: `local quest = client:Quest(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local quest, err = client:Quest():load({ id = "quest_id" })
```


### System

Create an instance: `local system = client:System(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cpu_usage_percent` | `number` |  |
| `gc_gen0_collection` | `number` |  |
| `gc_gen1_collection` | `number` |  |
| `gc_gen2_collection` | `number` |  |
| `thread_count` | `number` |  |
| `total_memory_byte` | `number` |  |
| `used_memory_byte` | `number` |  |

#### Example: Load

```lua
local system, err = client:System():load()
```


### Tip

Create an instance: `local tip = client:Tip(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local tip, err = client:Tip():load()
```


### Wzn

Create an instance: `local wzn = client:Wzn(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local wzn, err = client:Wzn():load()
```


### Wzn2

Create an instance: `local wzn2 = client:Wzn2(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local wzn2, err = client:Wzn2():load()
```


### Wzn3

Create an instance: `local wzn3 = client:Wzn3(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local wzn3, err = client:Wzn3():load()
```


### Wzn4

Create an instance: `local wzn4 = client:Wzn4(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local wzn4, err = client:Wzn4():load()
```


### Wzn5

Create an instance: `local wzn5 = client:Wzn5(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local wzn5, err = client:Wzn5():load()
```


### Wzn6

Create an instance: `local wzn6 = client:Wzn6(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local wzn6, err = client:Wzn6():load()
```


### ZMap

Create an instance: `local z_map = client:ZMap(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local z_map, err = client:ZMap():load()
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── maplestory_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`maplestory_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```lua
local android = client:Android()
android:load({ id = 1 })

-- android:data_get() now returns the android data from the last load
-- android:match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
