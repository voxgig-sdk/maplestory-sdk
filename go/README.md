# Maplestory Golang SDK



The Golang SDK for the Maplestory API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.Android(nil)` — each with the same small set of operations (`List`, `Load`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/maplestory-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/maplestory-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/maplestory-sdk/go=../maplestory-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    sdk "github.com/voxgig-sdk/maplestory-sdk/go"
)

func main() {
    client := sdk.New()

    // Load a single android — the value is the loaded record.
    android, err := client.Android(nil).Load(map[string]any{"id": 1, "region": "example_region", "version": "example_version"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(android)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
android, err := client.Android(nil).Load(map[string]any{"id": 1}, nil)
if err != nil {
    // handle err
    return
}
_ = android
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

android, err := client.Android(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(android) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewMaplestorySDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
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
cd go && go test ./test/...
```


## Reference

### NewMaplestorySDK

```go
func NewMaplestorySDK(options map[string]any) *MaplestorySDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *MaplestorySDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### MaplestorySDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `Android` | `(data map[string]any) MaplestoryEntity` | Create an Android entity instance. |
| `Avatar` | `(data map[string]any) MaplestoryEntity` | Create an Avatar entity instance. |
| `Cache` | `(data map[string]any) MaplestoryEntity` | Create a Cache entity instance. |
| `Character` | `(data map[string]any) MaplestoryEntity` | Create a Character entity instance. |
| `Chat` | `(data map[string]any) MaplestoryEntity` | Create a Chat entity instance. |
| `Cluster` | `(data map[string]any) MaplestoryEntity` | Create a Cluster entity instance. |
| `Diff` | `(data map[string]any) MaplestoryEntity` | Create a Diff entity instance. |
| `Entity1` | `(data map[string]any) MaplestoryEntity` | Create an Entity1 entity instance. |
| `GmsNew` | `(data map[string]any) MaplestoryEntity` | Create a GmsNew entity instance. |
| `GuildMark` | `(data map[string]any) MaplestoryEntity` | Create a GuildMark entity instance. |
| `Health` | `(data map[string]any) MaplestoryEntity` | Create a Health entity instance. |
| `Item` | `(data map[string]any) MaplestoryEntity` | Create an Item entity instance. |
| `Job` | `(data map[string]any) MaplestoryEntity` | Create a Job entity instance. |
| `Map` | `(data map[string]any) MaplestoryEntity` | Create a Map entity instance. |
| `Metric` | `(data map[string]any) MaplestoryEntity` | Create a Metric entity instance. |
| `Mob` | `(data map[string]any) MaplestoryEntity` | Create a Mob entity instance. |
| `Music` | `(data map[string]any) MaplestoryEntity` | Create a Music entity instance. |
| `Name` | `(data map[string]any) MaplestoryEntity` | Create a Name entity instance. |
| `Npc` | `(data map[string]any) MaplestoryEntity` | Create a Npc entity instance. |
| `Nxf` | `(data map[string]any) MaplestoryEntity` | Create a Nxf entity instance. |
| `PerformanceMetric` | `(data map[string]any) MaplestoryEntity` | Create a PerformanceMetric entity instance. |
| `Pet` | `(data map[string]any) MaplestoryEntity` | Create a Pet entity instance. |
| `Quest` | `(data map[string]any) MaplestoryEntity` | Create a Quest entity instance. |
| `System` | `(data map[string]any) MaplestoryEntity` | Create a System entity instance. |
| `Tip` | `(data map[string]any) MaplestoryEntity` | Create a Tip entity instance. |
| `Wzn` | `(data map[string]any) MaplestoryEntity` | Create a Wzn entity instance. |
| `Wzn2` | `(data map[string]any) MaplestoryEntity` | Create a Wzn2 entity instance. |
| `Wzn3` | `(data map[string]any) MaplestoryEntity` | Create a Wzn3 entity instance. |
| `Wzn4` | `(data map[string]any) MaplestoryEntity` | Create a Wzn4 entity instance. |
| `Wzn5` | `(data map[string]any) MaplestoryEntity` | Create a Wzn5 entity instance. |
| `Wzn6` | `(data map[string]any) MaplestoryEntity` | Create a Wzn6 entity instance. |
| `ZMap` | `(data map[string]any) MaplestoryEntity` | Create a ZMap entity instance. |

### Entity interface (MaplestoryEntity)

All entities implement the `MaplestoryEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` | the entity record (`map[string]any`) |
| `List` | a `[]any` of entity records |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    android, err := client.Android(nil).Load(map[string]any{"id": "example_id"}, nil)
    if err != nil { /* handle */ }
    // android is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

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
| `"eviction_count"` |  |
| `"hit_count"` |  |
| `"hit_ratio"` |  |
| `"memory_usage"` |  |
| `"miss_count"` |  |
| `"total_entry"` |  |

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
| `"hostname"` |  |
| `"last_seen"` |  |
| `"metric"` |  |

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
| `"active_request"` |  |
| `"average_response_time_m"` |  |
| `"cache"` |  |
| `"errors_by_type"` |  |
| `"last_updated"` |  |
| `"memory_used_byte"` |  |
| `"redis_cache"` |  |
| `"requests_per_second"` |  |
| `"start_time"` |  |
| `"system"` |  |
| `"total_error"` |  |
| `"total_request"` |  |
| `"wz_properties_loaded"` |  |

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
| `"cpu_usage_percent"` |  |
| `"gc_gen0_collection"` |  |
| `"gc_gen1_collection"` |  |
| `"gc_gen2_collection"` |  |
| `"thread_count"` |  |
| `"total_memory_byte"` |  |
| `"used_memory_byte"` |  |

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

Create an instance: `android := client.Android(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
android, err := client.Android(nil).Load(map[string]any{"id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(android) // the loaded record
```


### Avatar

Create an instance: `avatar := client.Avatar(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
avatar, err := client.Avatar(nil).Load(map[string]any{"animation": "animation", "frame": 1}, nil)
if err != nil {
    panic(err)
}
fmt.Println(avatar) // the loaded record
```


### Cache

Create an instance: `cache := client.Cache(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `eviction_count` | `int` |  |
| `hit_count` | `int` |  |
| `hit_ratio` | `float64` |  |
| `memory_usage` | `int` |  |
| `miss_count` | `int` |  |
| `total_entry` | `int` |  |

#### Example: Load

```go
cache, err := client.Cache(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(cache) // the loaded record
```


### Character

Create an instance: `character := client.Character(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
character, err := client.Character(nil).Load(map[string]any{"region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(character) // the loaded record
```


### Chat

Create an instance: `chat := client.Chat(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
chat, err := client.Chat(nil).Load(map[string]any{"region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(chat) // the loaded record
```


### Cluster

Create an instance: `cluster := client.Cluster(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `hostname` | `string` |  |
| `last_seen` | `string` |  |
| `metric` | `map[string]any` |  |

#### Example: List

```go
clusters, err := client.Cluster(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(clusters) // the array of records
```


### Diff

Create an instance: `diff := client.Diff(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
diff, err := client.Diff(nil).Load(map[string]any{"region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(diff) // the loaded record
```


### Entity1

Create an instance: `entity1 := client.Entity1(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
entity1, err := client.Entity1(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(entity1) // the loaded record
```


### GmsNew

Create an instance: `gmsNew := client.GmsNew(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
gmsNew, err := client.GmsNew(nil).Load(map[string]any{"id": 1}, nil)
if err != nil {
    panic(err)
}
fmt.Println(gmsNew) // the loaded record
```


### GuildMark

Create an instance: `guildMark := client.GuildMark(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
guildMark, err := client.GuildMark(nil).Load(map[string]any{"guild_mark_id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(guildMark) // the loaded record
```


### Health

Create an instance: `health := client.Health(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
health, err := client.Health(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(health) // the loaded record
```


### Item

Create an instance: `item := client.Item(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
item, err := client.Item(nil).Load(map[string]any{"id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(item) // the loaded record
```


### Job

Create an instance: `job := client.Job(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
job, err := client.Job(nil).Load(map[string]any{"id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(job) // the loaded record
```


### Map

Create an instance: `map_ := client.Map(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
map_, err := client.Map(nil).Load(map[string]any{"id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(map_) // the loaded record
```


### Metric

Create an instance: `metric := client.Metric(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
metric, err := client.Metric(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(metric) // the loaded record
```


### Mob

Create an instance: `mob := client.Mob(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
mob, err := client.Mob(nil).Load(map[string]any{"id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(mob) // the loaded record
```


### Music

Create an instance: `music := client.Music(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
music, err := client.Music(nil).Load(map[string]any{"id": "music_id", "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(music) // the loaded record
```


### Name

Create an instance: `name := client.Name(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
name, err := client.Name(nil).Load(map[string]any{"region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(name) // the loaded record
```


### Npc

Create an instance: `npc := client.Npc(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
npc, err := client.Npc(nil).Load(map[string]any{"id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(npc) // the loaded record
```


### Nxf

Create an instance: `nxf := client.Nxf(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
nxf, err := client.Nxf(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(nxf) // the loaded record
```


### PerformanceMetric

Create an instance: `performanceMetric := client.PerformanceMetric(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `active_request` | `int` |  |
| `average_response_time_m` | `float64` |  |
| `cache` | `map[string]any` |  |
| `errors_by_type` | `map[string]any` |  |
| `last_updated` | `string` |  |
| `memory_used_byte` | `int` |  |
| `redis_cache` | `map[string]any` |  |
| `requests_per_second` | `float64` |  |
| `start_time` | `string` |  |
| `system` | `map[string]any` |  |
| `total_error` | `int` |  |
| `total_request` | `int` |  |
| `wz_properties_loaded` | `int` |  |

#### Example: Load

```go
performanceMetric, err := client.PerformanceMetric(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(performanceMetric) // the loaded record
```


### Pet

Create an instance: `pet := client.Pet(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
pet, err := client.Pet(nil).Load(map[string]any{"id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(pet) // the loaded record
```


### Quest

Create an instance: `quest := client.Quest(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
quest, err := client.Quest(nil).Load(map[string]any{"id": 1, "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(quest) // the loaded record
```


### System

Create an instance: `system := client.System(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cpu_usage_percent` | `float64` |  |
| `gc_gen0_collection` | `int` |  |
| `gc_gen1_collection` | `int` |  |
| `gc_gen2_collection` | `int` |  |
| `thread_count` | `int` |  |
| `total_memory_byte` | `int` |  |
| `used_memory_byte` | `int` |  |

#### Example: Load

```go
system, err := client.System(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(system) // the loaded record
```


### Tip

Create an instance: `tip := client.Tip(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
tip, err := client.Tip(nil).Load(map[string]any{"region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(tip) // the loaded record
```


### Wzn

Create an instance: `wzn := client.Wzn(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
wzn, err := client.Wzn(nil).Load(map[string]any{"region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(wzn) // the loaded record
```


### Wzn2

Create an instance: `wzn2 := client.Wzn2(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
wzn2, err := client.Wzn2(nil).Load(map[string]any{"path": "path", "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(wzn2) // the loaded record
```


### Wzn3

Create an instance: `wzn3 := client.Wzn3(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
wzn3, err := client.Wzn3(nil).Load(map[string]any{"path": "path", "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(wzn3) // the loaded record
```


### Wzn4

Create an instance: `wzn4 := client.Wzn4(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
wzn4, err := client.Wzn4(nil).Load(map[string]any{"path": "path", "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(wzn4) // the loaded record
```


### Wzn5

Create an instance: `wzn5 := client.Wzn5(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
wzn5, err := client.Wzn5(nil).Load(map[string]any{"path": "path", "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(wzn5) // the loaded record
```


### Wzn6

Create an instance: `wzn6 := client.Wzn6(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
wzn6, err := client.Wzn6(nil).Load(map[string]any{"path": "path", "region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(wzn6) // the loaded record
```


### ZMap

Create an instance: `zMap := client.ZMap(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
zMap, err := client.ZMap(nil).Load(map[string]any{"region": "region", "version": "version"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(zMap) // the loaded record
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/maplestory-sdk/go/
├── maplestory.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/maplestory-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
android := client.Android(nil)
android.Load(map[string]any{"id": 1}, nil)

// android.Data() now returns the android data from the last load
// android.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
