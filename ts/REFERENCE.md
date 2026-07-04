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

#### `Wzn2(data?: object)`

Create a new `Wzn2` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `Wzn2Entity` instance.

#### `Wzn3(data?: object)`

Create a new `Wzn3` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `Wzn3Entity` instance.

#### `Wzn4(data?: object)`

Create a new `Wzn4` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `Wzn4Entity` instance.

#### `Wzn5(data?: object)`

Create a new `Wzn5` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `Wzn5Entity` instance.

#### `Wzn6(data?: object)`

Create a new `Wzn6` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `Wzn6Entity` instance.

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
const android = client.android
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.android.load({ id: 'android_id' })
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
const avatar = client.avatar
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.avatar.load({ id: 'avatar_id' })
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
const cache = client.cache
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `eviction_count` | ``$INTEGER`` | No |  |
| `hit_count` | ``$INTEGER`` | No |  |
| `hit_ratio` | ``$NUMBER`` | No |  |
| `memory_usage` | ``$INTEGER`` | No |  |
| `miss_count` | ``$INTEGER`` | No |  |
| `total_entry` | ``$INTEGER`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.cache.load({ id: 'cache_id' })
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
const character = client.character
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.character.load({ id: 'character_id' })
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
const chat = client.chat
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.chat.load({ id: 'chat_id' })
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
const cluster = client.cluster
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hostname` | ``$STRING`` | No |  |
| `last_seen` | ``$STRING`` | No |  |
| `metric` | ``$OBJECT`` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.cluster.list()
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
const diff = client.diff
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.diff.load({ id: 'diff_id' })
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
const entity1 = client.entity1
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.entity1.load({ id: 'entity1_id' })
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
const gms_new = client.gms_new
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.gms_new.load({ id: 'gms_new_id' })
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
const guild_mark = client.guild_mark
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.guild_mark.load({ id: 'guild_mark_id' })
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
const health = client.health
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.health.load({ id: 'health_id' })
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
const item = client.item
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.item.load({ id: 'item_id' })
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
const job = client.job
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.job.load({ id: 'job_id' })
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
const map = client.map
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.map.load({ id: 'map_id' })
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
const metric = client.metric
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.metric.load({ id: 'metric_id' })
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
const mob = client.mob
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.mob.load({ id: 'mob_id' })
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
const music = client.music
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.music.load({ id: 'music_id' })
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
const name = client.name
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.name.load({ id: 'name_id' })
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
const npc = client.npc
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.npc.load({ id: 'npc_id' })
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
const nxf = client.nxf
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.nxf.load({ id: 'nxf_id' })
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
const performance_metric = client.performance_metric
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `active_request` | ``$INTEGER`` | No |  |
| `average_response_time_m` | ``$NUMBER`` | No |  |
| `cache` | ``$OBJECT`` | No |  |
| `errors_by_type` | ``$OBJECT`` | No |  |
| `last_updated` | ``$STRING`` | No |  |
| `memory_used_byte` | ``$INTEGER`` | No |  |
| `redis_cache` | ``$OBJECT`` | No |  |
| `requests_per_second` | ``$NUMBER`` | No |  |
| `start_time` | ``$STRING`` | No |  |
| `system` | ``$OBJECT`` | No |  |
| `total_error` | ``$INTEGER`` | No |  |
| `total_request` | ``$INTEGER`` | No |  |
| `wz_properties_loaded` | ``$INTEGER`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.performance_metric.load({ id: 'performance_metric_id' })
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
const pet = client.pet
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.pet.load({ id: 'pet_id' })
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
const quest = client.quest
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.quest.load({ id: 'quest_id' })
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
const system = client.system
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cpu_usage_percent` | ``$NUMBER`` | No |  |
| `gc_gen0_collection` | ``$INTEGER`` | No |  |
| `gc_gen1_collection` | ``$INTEGER`` | No |  |
| `gc_gen2_collection` | ``$INTEGER`` | No |  |
| `thread_count` | ``$INTEGER`` | No |  |
| `total_memory_byte` | ``$INTEGER`` | No |  |
| `used_memory_byte` | ``$INTEGER`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.system.load({ id: 'system_id' })
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
const tip = client.tip
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.tip.load({ id: 'tip_id' })
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
const wzn = client.wzn
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.wzn.load({ id: 'wzn_id' })
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

## Wzn2Entity

```ts
const wzn2 = client.wzn2
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.wzn2.load({ id: 'wzn2_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `Wzn2Entity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Wzn3Entity

```ts
const wzn3 = client.wzn3
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.wzn3.load({ id: 'wzn3_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `Wzn3Entity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Wzn4Entity

```ts
const wzn4 = client.wzn4
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.wzn4.load({ id: 'wzn4_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `Wzn4Entity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Wzn5Entity

```ts
const wzn5 = client.wzn5
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.wzn5.load({ id: 'wzn5_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `Wzn5Entity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Wzn6Entity

```ts
const wzn6 = client.wzn6
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.wzn6.load({ id: 'wzn6_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `Wzn6Entity` instance with the same client and
options.

#### `client()`

Return the parent `MaplestorySDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ZMapEntity

```ts
const z_map = client.z_map
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.z_map.load({ id: 'z_map_id' })
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

