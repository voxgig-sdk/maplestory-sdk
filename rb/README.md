# Maplestory Ruby SDK



The Ruby SDK for the Maplestory API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Android` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

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

Android is nested under region, so provide the `region`.

```ruby
begin
  # load returns the bare Android record (raises on error).
  android = client.Android.load({ "region" => "example_region", "version" => "example_version" })
  puts android
rescue => err
  warn "load failed: #{err}"
end
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  android = client.Android.load({ "id" => 1 })
rescue => err
  warn "load failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
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
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
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

# Entity ops return the bare mock record (raises on error).
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
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all). Raises on error. |
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
android = client.Android.load({ "id" => 1, "region" => "region", "version" => "version" })
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
avatar = client.Avatar.load({ "animation" => "animation", "frame" => 1 })
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
| `eviction_count` | `Integer` |  |
| `hit_count` | `Integer` |  |
| `hit_ratio` | `Float` |  |
| `memory_usage` | `Integer` |  |
| `miss_count` | `Integer` |  |
| `total_entry` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Cache record (raises on error).
cache = client.Cache.load()
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
character = client.Character.load({ "region" => "region", "version" => "version" })
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
chat = client.Chat.load({ "region" => "region", "version" => "version" })
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
| `hostname` | `String` |  |
| `last_seen` | `String` |  |
| `metric` | `Hash` |  |

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
diff = client.Diff.load({ "region" => "region", "version" => "version" })
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
entity1 = client.Entity1.load()
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
gms_new = client.GmsNew.load({ "id" => 1 })
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
guild_mark = client.GuildMark.load({ "guild_mark_id" => 1, "region" => "region", "version" => "version" })
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
health = client.Health.load()
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
item = client.Item.load({ "id" => 1, "region" => "region", "version" => "version" })
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
job = client.Job.load({ "id" => 1, "region" => "region", "version" => "version" })
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
map = client.Map.load({ "id" => 1, "region" => "region", "version" => "version" })
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
metric = client.Metric.load()
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
mob = client.Mob.load({ "id" => 1, "region" => "region", "version" => "version" })
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
music = client.Music.load({ "id" => "music_id", "region" => "region", "version" => "version" })
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
name = client.Name.load({ "region" => "region", "version" => "version" })
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
npc = client.Npc.load({ "id" => 1, "region" => "region", "version" => "version" })
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
nxf = client.Nxf.load()
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
| `active_request` | `Integer` |  |
| `average_response_time_m` | `Float` |  |
| `cache` | `Hash` |  |
| `errors_by_type` | `Hash` |  |
| `last_updated` | `String` |  |
| `memory_used_byte` | `Integer` |  |
| `redis_cache` | `Hash` |  |
| `requests_per_second` | `Float` |  |
| `start_time` | `String` |  |
| `system` | `Hash` |  |
| `total_error` | `Integer` |  |
| `total_request` | `Integer` |  |
| `wz_properties_loaded` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare PerformanceMetric record (raises on error).
performance_metric = client.PerformanceMetric.load()
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
pet = client.Pet.load({ "id" => 1, "region" => "region", "version" => "version" })
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
quest = client.Quest.load({ "id" => 1, "region" => "region", "version" => "version" })
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
| `cpu_usage_percent` | `Float` |  |
| `gc_gen0_collection` | `Integer` |  |
| `gc_gen1_collection` | `Integer` |  |
| `gc_gen2_collection` | `Integer` |  |
| `thread_count` | `Integer` |  |
| `total_memory_byte` | `Integer` |  |
| `used_memory_byte` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare System record (raises on error).
system = client.System.load()
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
tip = client.Tip.load({ "region" => "region", "version" => "version" })
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
wzn = client.Wzn.load({ "region" => "region", "version" => "version" })
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
wzn2 = client.Wzn2.load({ "path" => "path", "region" => "region", "version" => "version" })
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
wzn3 = client.Wzn3.load({ "path" => "path", "region" => "region", "version" => "version" })
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
wzn4 = client.Wzn4.load({ "path" => "path", "region" => "region", "version" => "version" })
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
wzn5 = client.Wzn5.load({ "path" => "path", "region" => "region", "version" => "version" })
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
wzn6 = client.Wzn6.load({ "path" => "path", "region" => "region", "version" => "version" })
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
z_map = client.ZMap.load({ "region" => "region", "version" => "version" })
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
android.load({ "id" => 1 })

# android.data_get now returns the android data from the last load
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
