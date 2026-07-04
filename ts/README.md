# Maplestory TypeScript SDK



The TypeScript SDK for the Maplestory API — a type-safe, entity-oriented client with full async/await support.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/maplestory-sdk/releases](https://github.com/voxgig-sdk/maplestory-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { MaplestorySDK } from '@voxgig-sdk/maplestory'

const client = new MaplestorySDK()
```

### 3. Load an android

```ts
const result = await client.android.load({ id: 'example_id' })

if (result.ok) {
  console.log(result.data)
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = MaplestorySDK.test()

const result = await client.android.load({ id: 'test01' })
// result.ok === true
// result.data contains mock response data
```

You can also use the instance method:

```ts
const client = new MaplestorySDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.android

// First call sets internal match
await entity.load({ id: 'example' })

// Subsequent calls reuse the stored match
const data = entity.data()
console.log(data.id) // 'example'
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new MaplestorySDK({
  extend: [logger],
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
MAPLESTORY_TEST_LIVE=TRUE
```

Then run:

```bash
cd ts && npm test
```


## Reference

### MaplestorySDK

#### Constructor

```ts
new MaplestorySDK(options?: {
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `Android(data?)` | `AndroidEntity` | Create a Android entity instance. |
| `Avatar(data?)` | `AvatarEntity` | Create a Avatar entity instance. |
| `Cache(data?)` | `CacheEntity` | Create a Cache entity instance. |
| `Character(data?)` | `CharacterEntity` | Create a Character entity instance. |
| `Chat(data?)` | `ChatEntity` | Create a Chat entity instance. |
| `Cluster(data?)` | `ClusterEntity` | Create a Cluster entity instance. |
| `Diff(data?)` | `DiffEntity` | Create a Diff entity instance. |
| `Entity1(data?)` | `Entity1Entity` | Create a Entity1 entity instance. |
| `GmsNew(data?)` | `GmsNewEntity` | Create a GmsNew entity instance. |
| `GuildMark(data?)` | `GuildMarkEntity` | Create a GuildMark entity instance. |
| `Health(data?)` | `HealthEntity` | Create a Health entity instance. |
| `Item(data?)` | `ItemEntity` | Create a Item entity instance. |
| `Job(data?)` | `JobEntity` | Create a Job entity instance. |
| `Map(data?)` | `MapEntity` | Create a Map entity instance. |
| `Metric(data?)` | `MetricEntity` | Create a Metric entity instance. |
| `Mob(data?)` | `MobEntity` | Create a Mob entity instance. |
| `Music(data?)` | `MusicEntity` | Create a Music entity instance. |
| `Name(data?)` | `NameEntity` | Create a Name entity instance. |
| `Npc(data?)` | `NpcEntity` | Create a Npc entity instance. |
| `Nxf(data?)` | `NxfEntity` | Create a Nxf entity instance. |
| `PerformanceMetric(data?)` | `PerformanceMetricEntity` | Create a PerformanceMetric entity instance. |
| `Pet(data?)` | `PetEntity` | Create a Pet entity instance. |
| `Quest(data?)` | `QuestEntity` | Create a Quest entity instance. |
| `System(data?)` | `SystemEntity` | Create a System entity instance. |
| `Tip(data?)` | `TipEntity` | Create a Tip entity instance. |
| `Wzn(data?)` | `WznEntity` | Create a Wzn entity instance. |
| `Wzn2(data?)` | `Wzn2Entity` | Create a Wzn2 entity instance. |
| `Wzn3(data?)` | `Wzn3Entity` | Create a Wzn3 entity instance. |
| `Wzn4(data?)` | `Wzn4Entity` | Create a Wzn4 entity instance. |
| `Wzn5(data?)` | `Wzn5Entity` | Create a Wzn5 entity instance. |
| `Wzn6(data?)` | `Wzn6Entity` | Create a Wzn6 entity instance. |
| `ZMap(data?)` | `ZMapEntity` | Create a ZMap entity instance. |
| `tester(testopts?, sdkopts?)` | `MaplestorySDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `MaplestorySDK.test(testopts?, sdkopts?)` | `MaplestorySDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Result>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Result>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Result>` | Create a new entity. |
| `update` | `update(reqdata?, ctrl?): Promise<Result>` | Update an existing entity. |
| `remove` | `remove(reqmatch?, ctrl?): Promise<Result>` | Remove an entity. |
| `data` | `data(data?): any` | Get or set entity data. |
| `match` | `match(match?): any` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): MaplestorySDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Result shape

All entity operations return a Result object:

```ts
{
  ok: boolean      // true if the HTTP status is 2xx
  status: number   // HTTP status code
  headers: object  // response headers
  data: any        // parsed JSON response body
}
```

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

### Entities

#### Android

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/android/{androidId}`

#### Avatar

| Field | Description |
| --- | --- |

Operations: load.

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

Operations: load.

API path: `/api/metrics/cache`

#### Character

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/Character/animated/{skinId}/{items}/{animation}/{frame}`

#### Chat

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/chat`

#### Cluster

| Field | Description |
| --- | --- |
| `hostname` |  |
| `last_seen` |  |
| `metric` |  |

Operations: list.

API path: `/api/metrics/cluster`

#### Diff

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/diff`

#### Entity1

| Field | Description |
| --- | --- |

Operations: load.

API path: `/`

#### GmsNew

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/gms/latest/news/article/{id}`

#### GuildMark

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/GuildMark/background/{guildBackgroundId}/{guildBackgroundColorId}/mark/{guildMarkId}/{guildMarkColorId}`

#### Health

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/health/alive`

#### Item

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/item`

#### Job

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/job/{jobId}/skillbook/{skillId}`

#### Map

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/map/{mapId}/render/layer/{layer}/{frame}`

#### Metric

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/metrics/health`

#### Mob

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/mob`

#### Music

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/music/{songPath}`

#### Name

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/name`

#### Npc

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/npc/{npcId}/render/animated/{framebook}`

#### Nxf

| Field | Description |
| --- | --- |

Operations: load.

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

Operations: load.

API path: `/api/metrics`

#### Pet

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/pet/{petId}/render/{animation}/{frame}/{petEquip}`

#### Quest

| Field | Description |
| --- | --- |

Operations: load.

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

Operations: load.

API path: `/api/metrics/system`

#### Tip

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/tips`

#### Wzn

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/wz`

#### Wzn2

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/wz/audio/{region}/{version}/{path}`

#### Wzn3

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/wz/export/{region}/{version}/{path}`

#### Wzn4

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/wz/img/{region}/{version}/{path}`

#### Wzn5

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/wz/lookup/{region}/{version}/{path}`

#### Wzn6

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/wz/{region}/{version}/{path}`

#### ZMap

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/{region}/{version}/zmap`



## Entities


### Android

Create an instance: `const android = client.android`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const android = await client.android.load({ id: 'android_id' })
```


### Avatar

Create an instance: `const avatar = client.avatar`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const avatar = await client.avatar.load({ id: 'avatar_id' })
```


### Cache

Create an instance: `const cache = client.cache`

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

```ts
const cache = await client.cache.load({ id: 'cache_id' })
```


### Character

Create an instance: `const character = client.character`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const character = await client.character.load({ id: 'character_id' })
```


### Chat

Create an instance: `const chat = client.chat`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const chat = await client.chat.load({ id: 'chat_id' })
```


### Cluster

Create an instance: `const cluster = client.cluster`

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

```ts
const clusters = await client.cluster.list()
```


### Diff

Create an instance: `const diff = client.diff`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const diff = await client.diff.load({ id: 'diff_id' })
```


### Entity1

Create an instance: `const entity1 = client.entity1`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const entity1 = await client.entity1.load({ id: 'entity1_id' })
```


### GmsNew

Create an instance: `const gms_new = client.gms_new`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const gms_new = await client.gms_new.load({ id: 'gms_new_id' })
```


### GuildMark

Create an instance: `const guild_mark = client.guild_mark`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const guild_mark = await client.guild_mark.load({ id: 'guild_mark_id' })
```


### Health

Create an instance: `const health = client.health`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const health = await client.health.load({ id: 'health_id' })
```


### Item

Create an instance: `const item = client.item`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const item = await client.item.load({ id: 'item_id' })
```


### Job

Create an instance: `const job = client.job`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const job = await client.job.load({ id: 'job_id' })
```


### Map

Create an instance: `const map = client.map`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const map = await client.map.load({ id: 'map_id' })
```


### Metric

Create an instance: `const metric = client.metric`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const metric = await client.metric.load({ id: 'metric_id' })
```


### Mob

Create an instance: `const mob = client.mob`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const mob = await client.mob.load({ id: 'mob_id' })
```


### Music

Create an instance: `const music = client.music`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const music = await client.music.load({ id: 'music_id' })
```


### Name

Create an instance: `const name = client.name`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const name = await client.name.load({ id: 'name_id' })
```


### Npc

Create an instance: `const npc = client.npc`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const npc = await client.npc.load({ id: 'npc_id' })
```


### Nxf

Create an instance: `const nxf = client.nxf`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const nxf = await client.nxf.load({ id: 'nxf_id' })
```


### PerformanceMetric

Create an instance: `const performance_metric = client.performance_metric`

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

```ts
const performance_metric = await client.performance_metric.load({ id: 'performance_metric_id' })
```


### Pet

Create an instance: `const pet = client.pet`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const pet = await client.pet.load({ id: 'pet_id' })
```


### Quest

Create an instance: `const quest = client.quest`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const quest = await client.quest.load({ id: 'quest_id' })
```


### System

Create an instance: `const system = client.system`

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

```ts
const system = await client.system.load({ id: 'system_id' })
```


### Tip

Create an instance: `const tip = client.tip`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const tip = await client.tip.load({ id: 'tip_id' })
```


### Wzn

Create an instance: `const wzn = client.wzn`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn = await client.wzn.load({ id: 'wzn_id' })
```


### Wzn2

Create an instance: `const wzn2 = client.wzn2`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn2 = await client.wzn2.load({ id: 'wzn2_id' })
```


### Wzn3

Create an instance: `const wzn3 = client.wzn3`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn3 = await client.wzn3.load({ id: 'wzn3_id' })
```


### Wzn4

Create an instance: `const wzn4 = client.wzn4`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn4 = await client.wzn4.load({ id: 'wzn4_id' })
```


### Wzn5

Create an instance: `const wzn5 = client.wzn5`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn5 = await client.wzn5.load({ id: 'wzn5_id' })
```


### Wzn6

Create an instance: `const wzn6 = client.wzn6`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn6 = await client.wzn6.load({ id: 'wzn6_id' })
```


### ZMap

Create an instance: `const z_map = client.z_map`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const z_map = await client.z_map.load({ id: 'z_map_id' })
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
error is returned to the caller.

An unexpected exception triggers the `PreUnexpected` hook before
propagating.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
maplestory/
├── src/
│   ├── MaplestorySDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { MaplestorySDK } from '@voxgig-sdk/maplestory'
```

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const android = client.android
await android.load({ id: "example_id" })

// android.data() now returns the loaded android data
// android.match() returns { id: "example_id" }
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
