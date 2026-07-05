# Maplestory PHP SDK



The PHP SDK for the Maplestory API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Android()` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

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
    // load() returns the bare Android record (throws on error).
    $android = $client->Android()->load(["id" => "example_id"]);
    print_r($android);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $android = $client->Android()->load(["id" => 1]);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
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
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
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

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```php
$client = MaplestorySDK::test([
    "entity" => ["android" => ["test01" => ["id" => "test01"]]],
]);

// Entity ops return the bare mock record (throws on error).
$android = $client->Android()->load(["id" => "test01"]);
print_r($android);
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
| `Android` | `($data): AndroidEntity` | Create an Android entity instance. |
| `Avatar` | `($data): AvatarEntity` | Create an Avatar entity instance. |
| `Cache` | `($data): CacheEntity` | Create a Cache entity instance. |
| `Character` | `($data): CharacterEntity` | Create a Character entity instance. |
| `Chat` | `($data): ChatEntity` | Create a Chat entity instance. |
| `Cluster` | `($data): ClusterEntity` | Create a Cluster entity instance. |
| `Diff` | `($data): DiffEntity` | Create a Diff entity instance. |
| `Entity1` | `($data): Entity1Entity` | Create an Entity1 entity instance. |
| `GmsNew` | `($data): GmsNewEntity` | Create a GmsNew entity instance. |
| `GuildMark` | `($data): GuildMarkEntity` | Create a GuildMark entity instance. |
| `Health` | `($data): HealthEntity` | Create a Health entity instance. |
| `Item` | `($data): ItemEntity` | Create an Item entity instance. |
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
| `list` | `(?array $reqmatch = null, $ctrl): array` | List entities matching the criteria (call with no argument to list all). |
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

Create an instance: `$android = $client->Android();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Android record (throws on error).
$android = $client->Android()->load(["id" => "android_id"]);
```


### Avatar

Create an instance: `$avatar = $client->Avatar();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Avatar record (throws on error).
$avatar = $client->Avatar()->load();
```


### Cache

Create an instance: `$cache = $client->Cache();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `eviction_count` | `int` |  |
| `hit_count` | `int` |  |
| `hit_ratio` | `float` |  |
| `memory_usage` | `int` |  |
| `miss_count` | `int` |  |
| `total_entry` | `int` |  |

#### Example: Load

```php
// load() returns the bare Cache record (throws on error).
$cache = $client->Cache()->load();
```


### Character

Create an instance: `$character = $client->Character();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Character record (throws on error).
$character = $client->Character()->load();
```


### Chat

Create an instance: `$chat = $client->Chat();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Chat record (throws on error).
$chat = $client->Chat()->load();
```


### Cluster

Create an instance: `$cluster = $client->Cluster();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `hostname` | `string` |  |
| `last_seen` | `string` |  |
| `metric` | `array` |  |

#### Example: List

```php
// list() returns an array of Cluster records (throws on error).
$clusters = $client->Cluster()->list();
```


### Diff

Create an instance: `$diff = $client->Diff();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Diff record (throws on error).
$diff = $client->Diff()->load();
```


### Entity1

Create an instance: `$entity1 = $client->Entity1();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Entity1 record (throws on error).
$entity1 = $client->Entity1()->load();
```


### GmsNew

Create an instance: `$gms_new = $client->GmsNew();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare GmsNew record (throws on error).
$gms_new = $client->GmsNew()->load(["id" => "gms_new_id"]);
```


### GuildMark

Create an instance: `$guild_mark = $client->GuildMark();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare GuildMark record (throws on error).
$guild_mark = $client->GuildMark()->load();
```


### Health

Create an instance: `$health = $client->Health();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Health record (throws on error).
$health = $client->Health()->load();
```


### Item

Create an instance: `$item = $client->Item();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Item record (throws on error).
$item = $client->Item()->load(["id" => "item_id"]);
```


### Job

Create an instance: `$job = $client->Job();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Job record (throws on error).
$job = $client->Job()->load(["id" => "job_id"]);
```


### Map

Create an instance: `$map = $client->Map();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Map record (throws on error).
$map = $client->Map()->load(["id" => "map_id"]);
```


### Metric

Create an instance: `$metric = $client->Metric();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Metric record (throws on error).
$metric = $client->Metric()->load();
```


### Mob

Create an instance: `$mob = $client->Mob();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Mob record (throws on error).
$mob = $client->Mob()->load(["id" => "mob_id"]);
```


### Music

Create an instance: `$music = $client->Music();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Music record (throws on error).
$music = $client->Music()->load(["id" => "music_id"]);
```


### Name

Create an instance: `$name = $client->Name();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Name record (throws on error).
$name = $client->Name()->load();
```


### Npc

Create an instance: `$npc = $client->Npc();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Npc record (throws on error).
$npc = $client->Npc()->load(["id" => "npc_id"]);
```


### Nxf

Create an instance: `$nxf = $client->Nxf();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Nxf record (throws on error).
$nxf = $client->Nxf()->load();
```


### PerformanceMetric

Create an instance: `$performance_metric = $client->PerformanceMetric();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `active_request` | `int` |  |
| `average_response_time_m` | `float` |  |
| `cache` | `array` |  |
| `errors_by_type` | `array` |  |
| `last_updated` | `string` |  |
| `memory_used_byte` | `int` |  |
| `redis_cache` | `array` |  |
| `requests_per_second` | `float` |  |
| `start_time` | `string` |  |
| `system` | `array` |  |
| `total_error` | `int` |  |
| `total_request` | `int` |  |
| `wz_properties_loaded` | `int` |  |

#### Example: Load

```php
// load() returns the bare PerformanceMetric record (throws on error).
$performance_metric = $client->PerformanceMetric()->load();
```


### Pet

Create an instance: `$pet = $client->Pet();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Pet record (throws on error).
$pet = $client->Pet()->load(["id" => "pet_id"]);
```


### Quest

Create an instance: `$quest = $client->Quest();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Quest record (throws on error).
$quest = $client->Quest()->load(["id" => "quest_id"]);
```


### System

Create an instance: `$system = $client->System();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cpu_usage_percent` | `float` |  |
| `gc_gen0_collection` | `int` |  |
| `gc_gen1_collection` | `int` |  |
| `gc_gen2_collection` | `int` |  |
| `thread_count` | `int` |  |
| `total_memory_byte` | `int` |  |
| `used_memory_byte` | `int` |  |

#### Example: Load

```php
// load() returns the bare System record (throws on error).
$system = $client->System()->load();
```


### Tip

Create an instance: `$tip = $client->Tip();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Tip record (throws on error).
$tip = $client->Tip()->load();
```


### Wzn

Create an instance: `$wzn = $client->Wzn();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Wzn record (throws on error).
$wzn = $client->Wzn()->load();
```


### Wzn2

Create an instance: `$wzn2 = $client->Wzn2();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Wzn2 record (throws on error).
$wzn2 = $client->Wzn2()->load();
```


### Wzn3

Create an instance: `$wzn3 = $client->Wzn3();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Wzn3 record (throws on error).
$wzn3 = $client->Wzn3()->load();
```


### Wzn4

Create an instance: `$wzn4 = $client->Wzn4();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Wzn4 record (throws on error).
$wzn4 = $client->Wzn4()->load();
```


### Wzn5

Create an instance: `$wzn5 = $client->Wzn5();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Wzn5 record (throws on error).
$wzn5 = $client->Wzn5()->load();
```


### Wzn6

Create an instance: `$wzn6 = $client->Wzn6();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Wzn6 record (throws on error).
$wzn6 = $client->Wzn6()->load();
```


### ZMap

Create an instance: `$z_map = $client->ZMap();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare ZMap record (throws on error).
$z_map = $client->ZMap()->load();
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
$android = $client->Android();
$android->load(["id" => 1]);

// $android->data_get() now returns the android data from the last load
// $android->match_get() returns the last match criteria
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
