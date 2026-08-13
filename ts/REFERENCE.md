# Maplestory TypeScript SDK Reference

Complete API reference for the Maplestory TypeScript SDK.


## MaplestorySDK

### Constructor

```ts
new MaplestorySDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `MaplestorySDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = MaplestorySDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `MaplestorySDK` instance in test mode.


### Instance Methods

#### `Android(data?: object)`

Create a new `Android` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AndroidEntity` instance.

#### `Avatar(data?: object)`

Create a new `Avatar` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AvatarEntity` instance.

#### `Cache(data?: object)`

Create a new `Cache` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `CacheEntity` instance.

#### `Character(data?: object)`

Create a new `Character` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `CharacterEntity` instance.

#### `Chat(data?: object)`

Create a new `Chat` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ChatEntity` instance.

#### `Cluster(data?: object)`

Create a new `Cluster` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ClusterEntity` instance.

#### `Diff(data?: object)`

Create a new `Diff` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DiffEntity` instance.

#### `Entity1(data?: object)`

Create a new `Entity1` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `Entity1Entity` instance.

#### `GmsNew(data?: object)`

Create a new `GmsNew` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `GmsNewEntity` instance.

#### `GuildMark(data?: object)`

Create a new `GuildMark` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `GuildMarkEntity` instance.

#### `Health(data?: object)`

Create a new `Health` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `HealthEntity` instance.

#### `Item(data?: object)`

Create a new `Item` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ItemEntity` instance.

#### `Job(data?: object)`

Create a new `Job` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `JobEntity` instance.

#### `Map(data?: object)`

Create a new `Map` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MapEntity` instance.

#### `Metric(data?: object)`

Create a new `Metric` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MetricEntity` instance.

#### `Mob(data?: object)`

Create a new `Mob` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MobEntity` instance.

#### `Music(data?: object)`

Create a new `Music` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MusicEntity` instance.

#### `Name(data?: object)`

Create a new `Name` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `NameEntity` instance.

#### `Npc(data?: object)`

Create a new `Npc` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `NpcEntity` instance.

#### `Nxf(data?: object)`

Create a new `Nxf` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `NxfEntity` instance.

#### `PerformanceMetric(data?: object)`

Create a new `PerformanceMetric` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PerformanceMetricEntity` instance.

#### `Pet(data?: object)`

Create a new `Pet` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PetEntity` instance.

#### `Quest(data?: object)`

Create a new `Quest` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `QuestEntity` instance.

#### `System(data?: object)`

Create a new `System` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SystemEntity` instance.

#### `Tip(data?: object)`

Create a new `Tip` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TipEntity` instance.

#### `Wzn(data?: object)`

Create a new `Wzn` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `WznEntity` instance.

#### `ZMap(data?: object)`

Create a new `ZMap` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ZMapEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `MaplestorySDK.test()`.

**Returns:** `MaplestorySDK` instance in test mode.


---

## AndroidEntity

```ts
const android = client.Android()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Android().load({ id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AndroidEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## AvatarEntity

```ts
const avatar = client.Avatar()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Avatar().load({ animation: 'animation', frame: 1 })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AvatarEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## CacheEntity

```ts
const cache = client.Cache()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `evictionCount` | `number` | No |  |
| `hitCount` | `number` | No |  |
| `hitRatio` | `number` | No |  |
| `memoryUsage` | `number` | No |  |
| `missCount` | `number` | No |  |
| `totalEntries` | `number` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Cache().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `CacheEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## CharacterEntity

```ts
const character = client.Character()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Character().load({ region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `CharacterEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ChatEntity

```ts
const chat = client.Chat()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Chat().load({ region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ChatEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ClusterEntity

```ts
const cluster = client.Cluster()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hostname` | `string` | No |  |
| `lastSeen` | `string` | No |  |
| `metrics` | `Record<string, any>` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Cluster().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ClusterEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DiffEntity

```ts
const diff = client.Diff()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `grouped` | `/api/{region}/{version}/diff/grouped` | `client.Diff().load({ $action: 'grouped', ... })` |

An action returns that action's OWN response, which is not necessarily a
Diff record — check the API definition for its shape.

```ts
const result = await client.Diff().load({
  $action: 'grouped',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Diff().load({ region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DiffEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Entity1Entity

```ts
const entity1 = client.Entity1()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Entity1().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `Entity1Entity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## GmsNewEntity

```ts
const gms_new = client.GmsNew()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.GmsNew().load({ id: 1 })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `GmsNewEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## GuildMarkEntity

```ts
const guild_mark = client.GuildMark()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.GuildMark().load({ guild_mark_id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `GuildMarkEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## HealthEntity

```ts
const health = client.Health()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `alive` | `/api/health/alive` | `client.Health().load({ $action: 'alive', ... })` |
| `ready` | `/api/health/ready` | `client.Health().load({ $action: 'ready', ... })` |
| `start` | `/api/health/start` | `client.Health().load({ $action: 'start', ... })` |

An action returns that action's OWN response, which is not necessarily a
Health record — check the API definition for its shape.

```ts
const result = await client.Health().load({
  $action: 'alive',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Health().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `HealthEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ItemEntity

```ts
const item = client.Item()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `category` | `/api/{region}/{version}/item/category` | `client.Item().load({ $action: 'category', ... })` |
| `count` | `/api/{region}/{version}/item/count` | `client.Item().load({ $action: 'count', ... })` |
| `icon` | `/api/{region}/{version}/item/{itemId}/icon` | `client.Item().load({ $action: 'icon', ... })` |
| `icon_raw` | `/api/{region}/{version}/item/{itemId}/iconRaw` | `client.Item().load({ $action: 'icon_raw', ... })` |
| `list` | `/api/{region}/{version}/item/list` | `client.Item().load({ $action: 'list', ... })` |
| `name` | `/api/{region}/{version}/item/{itemId}/name` | `client.Item().load({ $action: 'name', ... })` |

An action returns that action's OWN response, which is not necessarily a
Item record — check the API definition for its shape.

```ts
const result = await client.Item().load({
  $action: 'category',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Item().load({ id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ItemEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## JobEntity

```ts
const job = client.Job()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `count` | `/api/{region}/{version}/job/count` | `client.Job().load({ $action: 'count', ... })` |
| `skillbook` | `/api/{region}/{version}/job/{jobId}/skillbook` | `client.Job().load({ $action: 'skillbook', ... })` |
| `skilltree` | `/api/{region}/{version}/job/skilltree` | `client.Job().load({ $action: 'skilltree', ... })` |

An action returns that action's OWN response, which is not necessarily a
Job record — check the API definition for its shape.

```ts
const result = await client.Job().load({
  $action: 'count',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Job().load({ id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `JobEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MapEntity

```ts
const map = client.Map()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `bgm` | `/api/{region}/{version}/map/{mapId}/bgm` | `client.Map().load({ $action: 'bgm', ... })` |
| `count` | `/api/{region}/{version}/map/count` | `client.Map().load({ $action: 'count', ... })` |
| `icon` | `/api/{region}/{version}/map/{mapId}/icon` | `client.Map().load({ $action: 'icon', ... })` |
| `minimap` | `/api/{region}/{version}/map/{mapId}/minimap` | `client.Map().load({ $action: 'minimap', ... })` |
| `name` | `/api/{region}/{version}/map/{mapId}/name` | `client.Map().load({ $action: 'name', ... })` |
| `worldmap` | `/api/{region}/{version}/map/worldmap` | `client.Map().load({ $action: 'worldmap', ... })` |

An action returns that action's OWN response, which is not necessarily a
Map record — check the API definition for its shape.

```ts
const result = await client.Map().load({
  $action: 'bgm',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Map().load({ id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MapEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MetricEntity

```ts
const metric = client.Metric()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `health` | `/api/metrics/health` | `client.Metric().load({ $action: 'health', ... })` |

An action returns that action's OWN response, which is not necessarily a
Metric record — check the API definition for its shape.

```ts
const result = await client.Metric().load({
  $action: 'health',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Metric().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MetricEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MobEntity

```ts
const mob = client.Mob()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `count` | `/api/{region}/{version}/mob/count` | `client.Mob().load({ $action: 'count', ... })` |
| `download` | `/api/{region}/{version}/mob/{mobId}/download` | `client.Mob().load({ $action: 'download', ... })` |
| `icon` | `/api/{region}/{version}/mob/{mobId}/icon` | `client.Mob().load({ $action: 'icon', ... })` |
| `name` | `/api/{region}/{version}/mob/{mobId}/name` | `client.Mob().load({ $action: 'name', ... })` |
| `sound` | `/api/{region}/{version}/mob/{mobId}/sound` | `client.Mob().load({ $action: 'sound', ... })` |

An action returns that action's OWN response, which is not necessarily a
Mob record — check the API definition for its shape.

```ts
const result = await client.Mob().load({
  $action: 'count',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Mob().load({ id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MobEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MusicEntity

```ts
const music = client.Music()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Music().load({ id: 'music_id', region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MusicEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## NameEntity

```ts
const name = client.Name()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Name().load({ region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `NameEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## NpcEntity

```ts
const npc = client.Npc()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `count` | `/api/{region}/{version}/npc/count` | `client.Npc().load({ $action: 'count', ... })` |
| `download` | `/api/{region}/{version}/npc/{npcId}/download` | `client.Npc().load({ $action: 'download', ... })` |
| `icon` | `/api/{region}/{version}/npc/{npcId}/icon` | `client.Npc().load({ $action: 'icon', ... })` |
| `name` | `/api/{region}/{version}/npc/{npcId}/name` | `client.Npc().load({ $action: 'name', ... })` |

An action returns that action's OWN response, which is not necessarily a
Npc record — check the API definition for its shape.

```ts
const result = await client.Npc().load({
  $action: 'count',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Npc().load({ id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `NpcEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## NxfEntity

```ts
const nxf = client.Nxf()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Nxf().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `NxfEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PerformanceMetricEntity

```ts
const performance_metric = client.PerformanceMetric()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activeRequests` | `number` | No |  |
| `averageResponseTimeMs` | `number` | No |  |
| `cache` | `Record<string, any>` | No |  |
| `errorsByType` | `Record<string, any>` | No |  |
| `lastUpdated` | `string` | No |  |
| `memoryUsedBytes` | `number` | No |  |
| `redisCache` | `Record<string, any>` | No |  |
| `requestsPerSecond` | `number` | No |  |
| `startTime` | `string` | No |  |
| `system` | `Record<string, any>` | No |  |
| `totalErrors` | `number` | No |  |
| `totalRequests` | `number` | No |  |
| `wzPropertiesLoaded` | `number` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.PerformanceMetric().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PerformanceMetricEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PetEntity

```ts
const pet = client.Pet()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `action` | `/api/{region}/{version}/pet/{petId}/actions` | `client.Pet().load({ $action: 'action', ... })` |
| `count` | `/api/{region}/{version}/pet/count` | `client.Pet().load({ $action: 'count', ... })` |
| `download` | `/api/{region}/{version}/pet/{petId}/download` | `client.Pet().load({ $action: 'download', ... })` |
| `name` | `/api/{region}/{version}/pet/{petId}/name` | `client.Pet().load({ $action: 'name', ... })` |

An action returns that action's OWN response, which is not necessarily a
Pet record — check the API definition for its shape.

```ts
const result = await client.Pet().load({
  $action: 'action',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Pet().load({ id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PetEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## QuestEntity

```ts
const quest = client.Quest()
```

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `category` | `/api/{region}/{version}/quest/category` | `client.Quest().load({ $action: 'category', ... })` |
| `count` | `/api/{region}/{version}/quest/count` | `client.Quest().load({ $action: 'count', ... })` |
| `icon` | `/api/{region}/{version}/quest/{questId}/icon` | `client.Quest().load({ $action: 'icon', ... })` |
| `name` | `/api/{region}/{version}/quest/{questId}/name` | `client.Quest().load({ $action: 'name', ... })` |

An action returns that action's OWN response, which is not necessarily a
Quest record — check the API definition for its shape.

```ts
const result = await client.Quest().load({
  $action: 'category',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Quest().load({ id: 1, region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `QuestEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## SystemEntity

```ts
const system = client.System()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cpuUsagePercent` | `number` | No |  |
| `gcGen0Collections` | `number` | No |  |
| `gcGen1Collections` | `number` | No |  |
| `gcGen2Collections` | `number` | No |  |
| `threadCount` | `number` | No |  |
| `totalMemoryBytes` | `number` | No |  |
| `usedMemoryBytes` | `number` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.System().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SystemEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TipEntity

```ts
const tip = client.Tip()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Tip().load({ region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TipEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## WznEntity

```ts
const wzn = client.Wzn()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Wzn().load({ region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `WznEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ZMapEntity

```ts
const z_map = client.ZMap()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.ZMap().load({ region: 'region', version: 'version' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ZMapEntity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new MaplestorySDK({
  feature: {
    test: { active: true },
  }
})
```

