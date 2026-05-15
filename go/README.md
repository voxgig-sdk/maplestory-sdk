# Maplestory Golang SDK

The Golang SDK for the Maplestory API. Provides an entity-oriented interface using standard Go conventions — no generics required, data flows as `map[string]any`.


## Install
```bash
go get github.com/voxgig-sdk/maplestory-sdk
```

If the module is not yet published to a registry, use a `replace` directive
in your `go.mod` to point to a local checkout:

```bash
go mod edit -replace github.com/voxgig-sdk/maplestory-sdk=../path/to/github.com/voxgig-sdk/maplestory-sdk
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```go
package main

import (
    "fmt"
    "os"

    sdk "github.com/voxgig-sdk/maplestory-sdk"
    "github.com/voxgig-sdk/maplestory-sdk/core"
)

func main() {
    client := sdk.NewMaplestorySDK(map[string]any{
        "apikey": os.Getenv("MAPLESTORY_APIKEY"),
    })
```

### 3. Load a android

```go
    result, err = client.Android(nil).Load(
        map[string]any{"id": "example_id"}, nil,
    )
    if err != nil {
        panic(err)
    }

    rm = core.ToMapAny(result)
    if rm["ok"] == true {
        fmt.Println(rm["data"])
    }
}
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
client := sdk.TestSDK(nil, nil)

result, err := client.Planet(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
// result contains mock response data
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
MAPLESTORY_APIKEY=<your-key>
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
| `"apikey"` | `string` | API key for authentication. |
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
| `Android` | `(data map[string]any) MaplestoryEntity` | Create a Android entity instance. |
| `Avatar` | `(data map[string]any) MaplestoryEntity` | Create a Avatar entity instance. |
| `Cache` | `(data map[string]any) MaplestoryEntity` | Create a Cache entity instance. |
| `Character` | `(data map[string]any) MaplestoryEntity` | Create a Character entity instance. |
| `Chat` | `(data map[string]any) MaplestoryEntity` | Create a Chat entity instance. |
| `Cluster` | `(data map[string]any) MaplestoryEntity` | Create a Cluster entity instance. |
| `Diff` | `(data map[string]any) MaplestoryEntity` | Create a Diff entity instance. |
| `Entity1` | `(data map[string]any) MaplestoryEntity` | Create a Entity1 entity instance. |
| `GmsNew` | `(data map[string]any) MaplestoryEntity` | Create a GmsNew entity instance. |
| `GuildMark` | `(data map[string]any) MaplestoryEntity` | Create a GuildMark entity instance. |
| `Health` | `(data map[string]any) MaplestoryEntity` | Create a Health entity instance. |
| `Item` | `(data map[string]any) MaplestoryEntity` | Create a Item entity instance. |
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
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Update` | `(reqdata, ctrl map[string]any) (any, error)` | Update an existing entity. |
| `Remove` | `(reqmatch, ctrl map[string]any) (any, error)` | Remove an entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(any, error)`. The `any` value is a
`map[string]any` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `"ok"` | `bool` | `true` if the HTTP status is 2xx. |
| `"status"` | `int` | HTTP status code. |
| `"headers"` | `map[string]any` | Response headers. |
| `"data"` | `any` | Parsed JSON response body. |

On error, `"ok"` is `false` and `"err"` contains the error value.

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
result, err := client.Android(nil).Load(map[string]any{"id": "android_id"}, nil)
```


### Avatar

Create an instance: `avatar := client.Avatar(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Avatar(nil).Load(map[string]any{"id": "avatar_id"}, nil)
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
| `eviction_count` | ``$INTEGER`` |  |
| `hit_count` | ``$INTEGER`` |  |
| `hit_ratio` | ``$NUMBER`` |  |
| `memory_usage` | ``$INTEGER`` |  |
| `miss_count` | ``$INTEGER`` |  |
| `total_entry` | ``$INTEGER`` |  |

#### Example: Load

```go
result, err := client.Cache(nil).Load(map[string]any{"id": "cache_id"}, nil)
```


### Character

Create an instance: `character := client.Character(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Character(nil).Load(map[string]any{"id": "character_id"}, nil)
```


### Chat

Create an instance: `chat := client.Chat(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Chat(nil).Load(map[string]any{"id": "chat_id"}, nil)
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
| `hostname` | ``$STRING`` |  |
| `last_seen` | ``$STRING`` |  |
| `metric` | ``$OBJECT`` |  |

#### Example: List

```go
results, err := client.Cluster(nil).List(nil, nil)
```


### Diff

Create an instance: `diff := client.Diff(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Diff(nil).Load(map[string]any{"id": "diff_id"}, nil)
```


### Entity1

Create an instance: `entity1 := client.Entity1(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Entity1(nil).Load(map[string]any{"id": "entity1_id"}, nil)
```


### GmsNew

Create an instance: `gms_new := client.GmsNew(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.GmsNew(nil).Load(map[string]any{"id": "gms_new_id"}, nil)
```


### GuildMark

Create an instance: `guild_mark := client.GuildMark(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.GuildMark(nil).Load(map[string]any{"id": "guild_mark_id"}, nil)
```


### Health

Create an instance: `health := client.Health(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Health(nil).Load(map[string]any{"id": "health_id"}, nil)
```


### Item

Create an instance: `item := client.Item(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Item(nil).Load(map[string]any{"id": "item_id"}, nil)
```


### Job

Create an instance: `job := client.Job(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Job(nil).Load(map[string]any{"id": "job_id"}, nil)
```


### Map

Create an instance: `map := client.Map(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Map(nil).Load(map[string]any{"id": "map_id"}, nil)
```


### Metric

Create an instance: `metric := client.Metric(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Metric(nil).Load(map[string]any{"id": "metric_id"}, nil)
```


### Mob

Create an instance: `mob := client.Mob(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Mob(nil).Load(map[string]any{"id": "mob_id"}, nil)
```


### Music

Create an instance: `music := client.Music(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Music(nil).Load(map[string]any{"id": "music_id"}, nil)
```


### Name

Create an instance: `name := client.Name(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Name(nil).Load(map[string]any{"id": "name_id"}, nil)
```


### Npc

Create an instance: `npc := client.Npc(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Npc(nil).Load(map[string]any{"id": "npc_id"}, nil)
```


### Nxf

Create an instance: `nxf := client.Nxf(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Nxf(nil).Load(map[string]any{"id": "nxf_id"}, nil)
```


### PerformanceMetric

Create an instance: `performance_metric := client.PerformanceMetric(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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

```go
result, err := client.PerformanceMetric(nil).Load(map[string]any{"id": "performance_metric_id"}, nil)
```


### Pet

Create an instance: `pet := client.Pet(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Pet(nil).Load(map[string]any{"id": "pet_id"}, nil)
```


### Quest

Create an instance: `quest := client.Quest(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Quest(nil).Load(map[string]any{"id": "quest_id"}, nil)
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
| `cpu_usage_percent` | ``$NUMBER`` |  |
| `gc_gen0_collection` | ``$INTEGER`` |  |
| `gc_gen1_collection` | ``$INTEGER`` |  |
| `gc_gen2_collection` | ``$INTEGER`` |  |
| `thread_count` | ``$INTEGER`` |  |
| `total_memory_byte` | ``$INTEGER`` |  |
| `used_memory_byte` | ``$INTEGER`` |  |

#### Example: Load

```go
result, err := client.System(nil).Load(map[string]any{"id": "system_id"}, nil)
```


### Tip

Create an instance: `tip := client.Tip(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Tip(nil).Load(map[string]any{"id": "tip_id"}, nil)
```


### Wzn

Create an instance: `wzn := client.Wzn(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Wzn(nil).Load(map[string]any{"id": "wzn_id"}, nil)
```


### Wzn2

Create an instance: `wzn2 := client.Wzn2(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Wzn2(nil).Load(map[string]any{"id": "wzn2_id"}, nil)
```


### Wzn3

Create an instance: `wzn3 := client.Wzn3(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Wzn3(nil).Load(map[string]any{"id": "wzn3_id"}, nil)
```


### Wzn4

Create an instance: `wzn4 := client.Wzn4(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Wzn4(nil).Load(map[string]any{"id": "wzn4_id"}, nil)
```


### Wzn5

Create an instance: `wzn5 := client.Wzn5(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Wzn5(nil).Load(map[string]any{"id": "wzn5_id"}, nil)
```


### Wzn6

Create an instance: `wzn6 := client.Wzn6(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Wzn6(nil).Load(map[string]any{"id": "wzn6_id"}, nil)
```


### ZMap

Create an instance: `z_map := client.ZMap(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.ZMap(nil).Load(map[string]any{"id": "z_map_id"}, nil)
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
error is returned to the caller. An unexpected panic triggers the
`PreUnexpected` hook.

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
github.com/voxgig-sdk/maplestory-sdk/
├── maplestory.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/maplestory-sdk`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
moon := client.Moon(nil)
moon.Load(map[string]any{"planet_id": "earth", "id": "luna"}, nil)

// moon.Data() now returns the loaded moon data
// moon.Match() returns the last match criteria
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
