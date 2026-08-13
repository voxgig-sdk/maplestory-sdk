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
  const music = await client.Music().load({ id: "example_id", region: "example", version: "example" })
  console.log(music)
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

const music = await client.Music().load({ id: 'test01', region: 'example_region', version: 'example_version' })
// music is the entity, populated with mock response data
// — call music.data() for the record itself
console.log(music)
```

You can also use the instance method:

```ts
const client = new MaplestorySDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Music()

// First call runs the operation and stores its result
await entity.load({ id: 'example', region: 'example_region', version: 'example_version' })

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
| `evictionCount` |  |
| `hitCount` |  |
| `hitRatio` |  |
| `memoryUsage` |  |
| `missCount` |  |
| `totalEntries` |  |

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
| `lastSeen` |  |
| `metrics` |  |

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
| `activeRequests` |  |
| `averageResponseTimeMs` |  |
| `cache` |  |
| `errorsByType` |  |
| `lastUpdated` |  |
| `memoryUsedBytes` |  |
| `redisCache` |  |
| `requestsPerSecond` |  |
| `startTime` |  |
| `system` |  |
| `totalErrors` |  |
| `totalRequests` |  |
| `wzPropertiesLoaded` |  |

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
| `cpuUsagePercent` |  |
| `gcGen0Collections` |  |
| `gcGen1Collections` |  |
| `gcGen2Collections` |  |
| `threadCount` |  |
| `totalMemoryBytes` |  |
| `usedMemoryBytes` |  |

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

API path: `/api/wz/export/{region}/{version}/{path}`

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
| `evictionCount` | `number` |  |
| `hitCount` | `number` |  |
| `hitRatio` | `number` |  |
| `memoryUsage` | `number` |  |
| `missCount` | `number` |  |
| `totalEntries` | `number` |  |

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
| `lastSeen` | `string` |  |
| `metrics` | `Record<string, any>` |  |

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
| `activeRequests` | `number` |  |
| `averageResponseTimeMs` | `number` |  |
| `cache` | `Record<string, any>` |  |
| `errorsByType` | `Record<string, any>` |  |
| `lastUpdated` | `string` |  |
| `memoryUsedBytes` | `number` |  |
| `redisCache` | `Record<string, any>` |  |
| `requestsPerSecond` | `number` |  |
| `startTime` | `string` |  |
| `system` | `Record<string, any>` |  |
| `totalErrors` | `number` |  |
| `totalRequests` | `number` |  |
| `wzPropertiesLoaded` | `number` |  |

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
| `cpuUsagePercent` | `number` |  |
| `gcGen0Collections` | `number` |  |
| `gcGen1Collections` | `number` |  |
| `gcGen2Collections` | `number` |  |
| `threadCount` | `number` |  |
| `totalMemoryBytes` | `number` |  |
| `usedMemoryBytes` | `number` |  |

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
const music = client.Music()
await music.load({ id: "example_id", region: "example", version: "example" })

// music.data() now returns the music data from the last `load`
// music.match() returns { id: "example_id" }
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
