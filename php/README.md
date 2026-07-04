# Maplestory PHP SDK



The PHP SDK for the Maplestory API — an entity-oriented client using PHP conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/maplestory-sdk/releases](https://github.com/voxgig-sdk/maplestory-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'maplestory_sdk.php';

$client = new MaplestorySDK();
```

### 3. Load an android

```php
try {
    $result = $client->android()->load(["id" => "example_id"]);
    print_r($result);
} catch (\Exception $err) {
    echo "Error: " . $err->getMessage();
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    echo "Error: " . $result["err"]->getMessage();
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```php
$client = MaplestorySDK::test();

$result = $client->android()->load(["id" => "test01"]);
// $result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new MaplestorySDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
MAPLESTORY_TEST_LIVE=TRUE
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### MaplestorySDK

```php
require_once 'maplestory_sdk.php';
$client = new MaplestorySDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = MaplestorySDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### MaplestorySDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `Android` | `($data): AndroidEntity` | Create a Android entity instance. |
| `Avatar` | `($data): AvatarEntity` | Create a Avatar entity instance. |
| `Cache` | `($data): CacheEntity` | Create a Cache entity instance. |
| `Character` | `($data): CharacterEntity` | Create a Character entity instance. |
| `Chat` | `($data): ChatEntity` | Create a Chat entity instance. |
| `Cluster` | `($data): ClusterEntity` | Create a Cluster entity instance. |
| `Diff` | `($data): DiffEntity` | Create a Diff entity instance. |
| `Entity1` | `($data): Entity1Entity` | Create a Entity1 entity instance. |
| `GmsNew` | `($data): GmsNewEntity` | Create a GmsNew entity instance. |
| `GuildMark` | `($data): GuildMarkEntity` | Create a GuildMark entity instance. |
| `Health` | `($data): HealthEntity` | Create a Health entity instance. |
| `Item` | `($data): ItemEntity` | Create a Item entity instance. |
| `Job` | `($data): JobEntity` | Create a Job entity instance. |
| `Map` | `($data): MapEntity` | Create a Map entity instance. |
| `Metric` | `($data): MetricEntity` | Create a Metric entity instance. |
| `Mob` | `($data): MobEntity` | Create a Mob entity instance. |
| `Music` | `($data): MusicEntity` | Create a Music entity instance. |
| `Name` | `($data): NameEntity` | Create a Name entity instance. |
| `Npc` | `($data): NpcEntity` | Create a Npc entity instance. |
| `Nxf` | `($data): NxfEntity` | Create a Nxf entity instance. |
| `PerformanceMetric` | `($data): PerformanceMetricEntity` | Create a PerformanceMetric entity instance. |
| `Pet` | `($data): PetEntity` | Create a Pet entity instance. |
| `Quest` | `($data): QuestEntity` | Create a Quest entity instance. |
| `System` | `($data): SystemEntity` | Create a System entity instance. |
| `Tip` | `($data): TipEntity` | Create a Tip entity instance. |
| `Wzn` | `($data): WznEntity` | Create a Wzn entity instance. |
| `Wzn2` | `($data): Wzn2Entity` | Create a Wzn2 entity instance. |
| `Wzn3` | `($data): Wzn3Entity` | Create a Wzn3 entity instance. |
| `Wzn4` | `($data): Wzn4Entity` | Create a Wzn4 entity instance. |
| `Wzn5` | `($data): Wzn5Entity` | Create a Wzn5 entity instance. |
| `Wzn6` | `($data): Wzn6Entity` | Create a Wzn6 entity instance. |
| `ZMap` | `($data): ZMapEntity` | Create a ZMap entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `($reqmatch, $ctrl): array` | List entities matching the criteria. |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `update` | `($reqdata, $ctrl): array` | Update an existing entity. |
| `remove` | `($reqmatch, $ctrl): array` | Remove an entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

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
error is returned to the caller as the second element in the return array.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── maplestory_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`maplestory_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```php
$android = $client->android();
$android->load(["id" => "example_id"]);

// $android->dataGet() now returns the loaded android data
// $android->matchGet() returns the last match criteria
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
