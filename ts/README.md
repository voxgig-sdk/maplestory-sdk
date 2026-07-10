# Maplestory TypeScript SDK



The TypeScript SDK for the Maplestory API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.Android()` — each with a small set of operations (`list`, `load`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

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

Android is nested under region, so provide the `region`.
`load()` returns the entity directly and throws on failure:

```ts
try {
  const android = await client.Android().load({
    region: 'example_region',
    version: 'example_version',
  })
  console.log(android)
} catch (err) {
  console.error('load failed:', err)
}
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const android = await client.Android().load({ id: 1 })
  console.log(android)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
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

if (result instanceof Error) {
  throw result
}
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

const android = await client.Android().load({ id: 1 })
// android is a bare entity populated with mock response data
console.log(android)
```

You can also use the instance method:

```ts
const client = new MaplestorySDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Android()

// First call runs the operation and stores its result
await entity.load({ id: 1 })

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data)
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
| `Android(data?)` | `AndroidEntity` | Create an Android entity instance. |
| `Avatar(data?)` | `AvatarEntity` | Create an Avatar entity instance. |
| `Cache(data?)` | `CacheEntity` | Create a Cache entity instance. |
| `Character(data?)` | `CharacterEntity` | Create a Character entity instance. |
| `Chat(data?)` | `ChatEntity` | Create a Chat entity instance. |
| `Cluster(data?)` | `ClusterEntity` | Create a Cluster entity instance. |
| `Diff(data?)` | `DiffEntity` | Create a Diff entity instance. |
| `Entity1(data?)` | `Entity1Entity` | Create an Entity1 entity instance. |
| `GmsNew(data?)` | `GmsNewEntity` | Create a GmsNew entity instance. |
| `GuildMark(data?)` | `GuildMarkEntity` | Create a GuildMark entity instance. |
| `Health(data?)` | `HealthEntity` | Create a Health entity instance. |
| `Item(data?)` | `ItemEntity` | Create an Item entity instance. |
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
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): MaplestorySDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load` resolves to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

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

Create an instance: `const android = client.Android()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const android = await client.Android().load({ id: 1, region: 'region', version: 'version' })
```


### Avatar

Create an instance: `const avatar = client.Avatar()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const avatar = await client.Avatar().load({ animation: 'animation', frame: 1 })
```


### Cache

Create an instance: `const cache = client.Cache()`

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

```ts
const cache = await client.Cache().load()
```


### Character

Create an instance: `const character = client.Character()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const character = await client.Character().load({ region: 'region', version: 'version' })
```


### Chat

Create an instance: `const chat = client.Chat()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const chat = await client.Chat().load({ region: 'region', version: 'version' })
```


### Cluster

Create an instance: `const cluster = client.Cluster()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `hostname` | `string` |  |
| `last_seen` | `string` |  |
| `metric` | `Record<string, any>` |  |

#### Example: List

```ts
const clusters = await client.Cluster().list()
```


### Diff

Create an instance: `const diff = client.Diff()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const diff = await client.Diff().load({ region: 'region', version: 'version' })
```


### Entity1

Create an instance: `const entity1 = client.Entity1()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const entity1 = await client.Entity1().load()
```


### GmsNew

Create an instance: `const gms_new = client.GmsNew()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const gms_new = await client.GmsNew().load({ id: 1 })
```


### GuildMark

Create an instance: `const guild_mark = client.GuildMark()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const guild_mark = await client.GuildMark().load({ guild_mark_id: 1, region: 'region', version: 'version' })
```


### Health

Create an instance: `const health = client.Health()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const health = await client.Health().load()
```


### Item

Create an instance: `const item = client.Item()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const item = await client.Item().load({ id: 1, region: 'region', version: 'version' })
```


### Job

Create an instance: `const job = client.Job()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const job = await client.Job().load({ id: 1, region: 'region', version: 'version' })
```


### Map

Create an instance: `const map = client.Map()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const map = await client.Map().load({ id: 1, region: 'region', version: 'version' })
```


### Metric

Create an instance: `const metric = client.Metric()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const metric = await client.Metric().load()
```


### Mob

Create an instance: `const mob = client.Mob()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const mob = await client.Mob().load({ id: 1, region: 'region', version: 'version' })
```


### Music

Create an instance: `const music = client.Music()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const music = await client.Music().load({ id: 'music_id', region: 'region', version: 'version' })
```


### Name

Create an instance: `const name = client.Name()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const name = await client.Name().load({ region: 'region', version: 'version' })
```


### Npc

Create an instance: `const npc = client.Npc()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const npc = await client.Npc().load({ id: 1, region: 'region', version: 'version' })
```


### Nxf

Create an instance: `const nxf = client.Nxf()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const nxf = await client.Nxf().load()
```


### PerformanceMetric

Create an instance: `const performance_metric = client.PerformanceMetric()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `active_request` | `number` |  |
| `average_response_time_m` | `number` |  |
| `cache` | `Record<string, any>` |  |
| `errors_by_type` | `Record<string, any>` |  |
| `last_updated` | `string` |  |
| `memory_used_byte` | `number` |  |
| `redis_cache` | `Record<string, any>` |  |
| `requests_per_second` | `number` |  |
| `start_time` | `string` |  |
| `system` | `Record<string, any>` |  |
| `total_error` | `number` |  |
| `total_request` | `number` |  |
| `wz_properties_loaded` | `number` |  |

#### Example: Load

```ts
const performance_metric = await client.PerformanceMetric().load()
```


### Pet

Create an instance: `const pet = client.Pet()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const pet = await client.Pet().load({ id: 1, region: 'region', version: 'version' })
```


### Quest

Create an instance: `const quest = client.Quest()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const quest = await client.Quest().load({ id: 1, region: 'region', version: 'version' })
```


### System

Create an instance: `const system = client.System()`

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

```ts
const system = await client.System().load()
```


### Tip

Create an instance: `const tip = client.Tip()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const tip = await client.Tip().load({ region: 'region', version: 'version' })
```


### Wzn

Create an instance: `const wzn = client.Wzn()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn = await client.Wzn().load({ region: 'region', version: 'version' })
```


### Wzn2

Create an instance: `const wzn2 = client.Wzn2()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn2 = await client.Wzn2().load({ path: 'path', region: 'region', version: 'version' })
```


### Wzn3

Create an instance: `const wzn3 = client.Wzn3()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn3 = await client.Wzn3().load({ path: 'path', region: 'region', version: 'version' })
```


### Wzn4

Create an instance: `const wzn4 = client.Wzn4()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn4 = await client.Wzn4().load({ path: 'path', region: 'region', version: 'version' })
```


### Wzn5

Create an instance: `const wzn5 = client.Wzn5()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn5 = await client.Wzn5().load({ path: 'path', region: 'region', version: 'version' })
```


### Wzn6

Create an instance: `const wzn6 = client.Wzn6()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const wzn6 = await client.Wzn6().load({ path: 'path', region: 'region', version: 'version' })
```


### ZMap

Create an instance: `const z_map = client.ZMap()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const z_map = await client.ZMap().load({ region: 'region', version: 'version' })
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
const android = client.Android()
await android.load({ id: 1 })

// android.data() now returns the android data from the last `load`
// android.match() returns { id: 1 }
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
