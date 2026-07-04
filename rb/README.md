# Maplestory Ruby SDK



The Ruby SDK for the Maplestory API — an entity-oriented client using idiomatic Ruby conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/maplestory-sdk/releases](https://github.com/voxgig-sdk/maplestory-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "Maplestory_sdk"

client = MaplestorySDK.new
```

### 3. Load an android

```ruby
begin
  # load returns the bare Android record (raises on error).
  android = client.Android.load({ "id" => "example_id" })
  puts android
rescue => err
  warn "load failed: #{err}"
end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  warn result["err"]
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```ruby
client = MaplestorySDK.test({
  "entity" => { "android" => { "test01" => { "id" => "test01" } } },
})

# load returns the bare mock record (raises on error).
android = client.Android.load({ "id" => "test01" })
puts android
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = MaplestorySDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
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
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### MaplestorySDK

```ruby
require_relative "Maplestory_sdk"
client = MaplestorySDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = MaplestorySDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### MaplestorySDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
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
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> Array` | List entities matching the criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `MaplestoryError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

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

Create an instance: `android = client.Android`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Android record (raises on error).
android = client.Android.load({ "id" => "android_id" })
```


### Avatar

Create an instance: `avatar = client.Avatar`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Avatar record (raises on error).
avatar = client.Avatar.load({ "id" => "avatar_id" })
```


### Cache

Create an instance: `cache = client.Cache`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `eviction_count` | ``$INTEGER`` |  |
| `hit_count` | ``$INTEGER`` |  |
| `hit_ratio` | ``$NUMBER`` |  |
| `memory_usage` | ``$INTEGER`` |  |
| `miss_count` | ``$INTEGER`` |  |
| `total_entry` | ``$INTEGER`` |  |

#### Example: Load

```ruby
# load returns the bare Cache record (raises on error).
cache = client.Cache.load({ "id" => "cache_id" })
```


### Character

Create an instance: `character = client.Character`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Character record (raises on error).
character = client.Character.load({ "id" => "character_id" })
```


### Chat

Create an instance: `chat = client.Chat`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Chat record (raises on error).
chat = client.Chat.load({ "id" => "chat_id" })
```


### Cluster

Create an instance: `cluster = client.Cluster`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `hostname` | ``$STRING`` |  |
| `last_seen` | ``$STRING`` |  |
| `metric` | ``$OBJECT`` |  |

#### Example: List

```ruby
# list returns an Array of Cluster records (raises on error).
clusters = client.Cluster.list
```


### Diff

Create an instance: `diff = client.Diff`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Diff record (raises on error).
diff = client.Diff.load({ "id" => "diff_id" })
```


### Entity1

Create an instance: `entity1 = client.Entity1`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Entity1 record (raises on error).
entity1 = client.Entity1.load({ "id" => "entity1_id" })
```


### GmsNew

Create an instance: `gms_new = client.GmsNew`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare GmsNew record (raises on error).
gms_new = client.GmsNew.load({ "id" => "gms_new_id" })
```


### GuildMark

Create an instance: `guild_mark = client.GuildMark`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare GuildMark record (raises on error).
guild_mark = client.GuildMark.load({ "id" => "guild_mark_id" })
```


### Health

Create an instance: `health = client.Health`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Health record (raises on error).
health = client.Health.load({ "id" => "health_id" })
```


### Item

Create an instance: `item = client.Item`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Item record (raises on error).
item = client.Item.load({ "id" => "item_id" })
```


### Job

Create an instance: `job = client.Job`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Job record (raises on error).
job = client.Job.load({ "id" => "job_id" })
```


### Map

Create an instance: `map = client.Map`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Map record (raises on error).
map = client.Map.load({ "id" => "map_id" })
```


### Metric

Create an instance: `metric = client.Metric`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Metric record (raises on error).
metric = client.Metric.load({ "id" => "metric_id" })
```


### Mob

Create an instance: `mob = client.Mob`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Mob record (raises on error).
mob = client.Mob.load({ "id" => "mob_id" })
```


### Music

Create an instance: `music = client.Music`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Music record (raises on error).
music = client.Music.load({ "id" => "music_id" })
```


### Name

Create an instance: `name = client.Name`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Name record (raises on error).
name = client.Name.load({ "id" => "name_id" })
```


### Npc

Create an instance: `npc = client.Npc`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Npc record (raises on error).
npc = client.Npc.load({ "id" => "npc_id" })
```


### Nxf

Create an instance: `nxf = client.Nxf`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Nxf record (raises on error).
nxf = client.Nxf.load({ "id" => "nxf_id" })
```


### PerformanceMetric

Create an instance: `performance_metric = client.PerformanceMetric`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `active_request` | ``$INTEGER`` |  |
| `average_response_time_m` | ``$NUMBER`` |  |
| `cache` | ``$OBJECT`` |  |
| `errors_by_type` | ``$OBJECT`` |  |
| `last_updated` | ``$STRING`` |  |
| `memory_used_byte` | ``$INTEGER`` |  |
| `redis_cache` | ``$OBJECT`` |  |
| `requests_per_second` | ``$NUMBER`` |  |
| `start_time` | ``$STRING`` |  |
| `system` | ``$OBJECT`` |  |
| `total_error` | ``$INTEGER`` |  |
| `total_request` | ``$INTEGER`` |  |
| `wz_properties_loaded` | ``$INTEGER`` |  |

#### Example: Load

```ruby
# load returns the bare PerformanceMetric record (raises on error).
performance_metric = client.PerformanceMetric.load({ "id" => "performance_metric_id" })
```


### Pet

Create an instance: `pet = client.Pet`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Pet record (raises on error).
pet = client.Pet.load({ "id" => "pet_id" })
```


### Quest

Create an instance: `quest = client.Quest`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Quest record (raises on error).
quest = client.Quest.load({ "id" => "quest_id" })
```


### System

Create an instance: `system = client.System`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cpu_usage_percent` | ``$NUMBER`` |  |
| `gc_gen0_collection` | ``$INTEGER`` |  |
| `gc_gen1_collection` | ``$INTEGER`` |  |
| `gc_gen2_collection` | ``$INTEGER`` |  |
| `thread_count` | ``$INTEGER`` |  |
| `total_memory_byte` | ``$INTEGER`` |  |
| `used_memory_byte` | ``$INTEGER`` |  |

#### Example: Load

```ruby
# load returns the bare System record (raises on error).
system = client.System.load({ "id" => "system_id" })
```


### Tip

Create an instance: `tip = client.Tip`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Tip record (raises on error).
tip = client.Tip.load({ "id" => "tip_id" })
```


### Wzn

Create an instance: `wzn = client.Wzn`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Wzn record (raises on error).
wzn = client.Wzn.load({ "id" => "wzn_id" })
```


### Wzn2

Create an instance: `wzn2 = client.Wzn2`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Wzn2 record (raises on error).
wzn2 = client.Wzn2.load({ "id" => "wzn2_id" })
```


### Wzn3

Create an instance: `wzn3 = client.Wzn3`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Wzn3 record (raises on error).
wzn3 = client.Wzn3.load({ "id" => "wzn3_id" })
```


### Wzn4

Create an instance: `wzn4 = client.Wzn4`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Wzn4 record (raises on error).
wzn4 = client.Wzn4.load({ "id" => "wzn4_id" })
```


### Wzn5

Create an instance: `wzn5 = client.Wzn5`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Wzn5 record (raises on error).
wzn5 = client.Wzn5.load({ "id" => "wzn5_id" })
```


### Wzn6

Create an instance: `wzn6 = client.Wzn6`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare Wzn6 record (raises on error).
wzn6 = client.Wzn6.load({ "id" => "wzn6_id" })
```


### ZMap

Create an instance: `z_map = client.ZMap`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the bare ZMap record (raises on error).
z_map = client.ZMap.load({ "id" => "z_map_id" })
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

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

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller as a second return value.

### Features and hooks

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── Maplestory_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`Maplestory_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```ruby
android = client.Android
android.load({ "id" => "example_id" })

# android.data_get now returns the loaded android data
# android.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
