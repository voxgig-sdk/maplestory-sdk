# Maplestory PHP SDK Reference

Complete API reference for the Maplestory PHP SDK.


## MaplestorySDK

### Constructor

```php
require_once __DIR__ . '/maplestory_sdk.php';

$client = new MaplestorySDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `MaplestorySDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = MaplestorySDK::test();
```


### Instance Methods

#### `Android($data = null)`

Create a new `AndroidEntity` instance. Pass `null` for no initial data.

#### `Avatar($data = null)`

Create a new `AvatarEntity` instance. Pass `null` for no initial data.

#### `Cache($data = null)`

Create a new `CacheEntity` instance. Pass `null` for no initial data.

#### `Character($data = null)`

Create a new `CharacterEntity` instance. Pass `null` for no initial data.

#### `Chat($data = null)`

Create a new `ChatEntity` instance. Pass `null` for no initial data.

#### `Cluster($data = null)`

Create a new `ClusterEntity` instance. Pass `null` for no initial data.

#### `Diff($data = null)`

Create a new `DiffEntity` instance. Pass `null` for no initial data.

#### `Entity1($data = null)`

Create a new `Entity1Entity` instance. Pass `null` for no initial data.

#### `GmsNew($data = null)`

Create a new `GmsNewEntity` instance. Pass `null` for no initial data.

#### `GuildMark($data = null)`

Create a new `GuildMarkEntity` instance. Pass `null` for no initial data.

#### `Health($data = null)`

Create a new `HealthEntity` instance. Pass `null` for no initial data.

#### `Item($data = null)`

Create a new `ItemEntity` instance. Pass `null` for no initial data.

#### `Job($data = null)`

Create a new `JobEntity` instance. Pass `null` for no initial data.

#### `Map($data = null)`

Create a new `MapEntity` instance. Pass `null` for no initial data.

#### `Metric($data = null)`

Create a new `MetricEntity` instance. Pass `null` for no initial data.

#### `Mob($data = null)`

Create a new `MobEntity` instance. Pass `null` for no initial data.

#### `Music($data = null)`

Create a new `MusicEntity` instance. Pass `null` for no initial data.

#### `Name($data = null)`

Create a new `NameEntity` instance. Pass `null` for no initial data.

#### `Npc($data = null)`

Create a new `NpcEntity` instance. Pass `null` for no initial data.

#### `Nxf($data = null)`

Create a new `NxfEntity` instance. Pass `null` for no initial data.

#### `PerformanceMetric($data = null)`

Create a new `PerformanceMetricEntity` instance. Pass `null` for no initial data.

#### `Pet($data = null)`

Create a new `PetEntity` instance. Pass `null` for no initial data.

#### `Quest($data = null)`

Create a new `QuestEntity` instance. Pass `null` for no initial data.

#### `System($data = null)`

Create a new `SystemEntity` instance. Pass `null` for no initial data.

#### `Tip($data = null)`

Create a new `TipEntity` instance. Pass `null` for no initial data.

#### `Wzn($data = null)`

Create a new `WznEntity` instance. Pass `null` for no initial data.

#### `Wzn2($data = null)`

Create a new `Wzn2Entity` instance. Pass `null` for no initial data.

#### `Wzn3($data = null)`

Create a new `Wzn3Entity` instance. Pass `null` for no initial data.

#### `Wzn4($data = null)`

Create a new `Wzn4Entity` instance. Pass `null` for no initial data.

#### `Wzn5($data = null)`

Create a new `Wzn5Entity` instance. Pass `null` for no initial data.

#### `Wzn6($data = null)`

Create a new `Wzn6Entity` instance. Pass `null` for no initial data.

#### `ZMap($data = null)`

Create a new `ZMapEntity` instance. Pass `null` for no initial data.

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. Returns `[$result, $err]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array [$result, $err]`

#### `prepare(array $fetchargs = []): array`

Prepare a fetch definition without sending the request. Returns `[$fetchdef, $err]`.


---

## AndroidEntity

```php
$android = $client->Android();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Android()->load(["id" => "android_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): AndroidEntity`

Create a new `AndroidEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## AvatarEntity

```php
$avatar = $client->Avatar();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Avatar()->load(["id" => "avatar_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): AvatarEntity`

Create a new `AvatarEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## CacheEntity

```php
$cache = $client->Cache();
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

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Cache()->load(["id" => "cache_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): CacheEntity`

Create a new `CacheEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## CharacterEntity

```php
$character = $client->Character();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Character()->load(["id" => "character_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): CharacterEntity`

Create a new `CharacterEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## ChatEntity

```php
$chat = $client->Chat();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Chat()->load(["id" => "chat_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): ChatEntity`

Create a new `ChatEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## ClusterEntity

```php
$cluster = $client->Cluster();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hostname` | ``$STRING`` | No |  |
| `last_seen` | ``$STRING`` | No |  |
| `metric` | ``$OBJECT`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): array`

List entities matching the given criteria. Returns an array.

```php
[$results, $err] = $client->Cluster()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): ClusterEntity`

Create a new `ClusterEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## DiffEntity

```php
$diff = $client->Diff();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Diff()->load(["id" => "diff_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): DiffEntity`

Create a new `DiffEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Entity1Entity

```php
$entity1 = $client->Entity1();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Entity1()->load(["id" => "entity1_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): Entity1Entity`

Create a new `Entity1Entity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## GmsNewEntity

```php
$gms_new = $client->GmsNew();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->GmsNew()->load(["id" => "gms_new_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): GmsNewEntity`

Create a new `GmsNewEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## GuildMarkEntity

```php
$guild_mark = $client->GuildMark();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->GuildMark()->load(["id" => "guild_mark_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): GuildMarkEntity`

Create a new `GuildMarkEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## HealthEntity

```php
$health = $client->Health();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Health()->load(["id" => "health_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): HealthEntity`

Create a new `HealthEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## ItemEntity

```php
$item = $client->Item();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Item()->load(["id" => "item_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): ItemEntity`

Create a new `ItemEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## JobEntity

```php
$job = $client->Job();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Job()->load(["id" => "job_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): JobEntity`

Create a new `JobEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## MapEntity

```php
$map = $client->Map();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Map()->load(["id" => "map_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): MapEntity`

Create a new `MapEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## MetricEntity

```php
$metric = $client->Metric();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Metric()->load(["id" => "metric_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): MetricEntity`

Create a new `MetricEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## MobEntity

```php
$mob = $client->Mob();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Mob()->load(["id" => "mob_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): MobEntity`

Create a new `MobEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## MusicEntity

```php
$music = $client->Music();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Music()->load(["id" => "music_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): MusicEntity`

Create a new `MusicEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## NameEntity

```php
$name = $client->Name();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Name()->load(["id" => "name_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): NameEntity`

Create a new `NameEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## NpcEntity

```php
$npc = $client->Npc();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Npc()->load(["id" => "npc_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): NpcEntity`

Create a new `NpcEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## NxfEntity

```php
$nxf = $client->Nxf();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Nxf()->load(["id" => "nxf_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): NxfEntity`

Create a new `NxfEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PerformanceMetricEntity

```php
$performance_metric = $client->PerformanceMetric();
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

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->PerformanceMetric()->load(["id" => "performance_metric_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PerformanceMetricEntity`

Create a new `PerformanceMetricEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PetEntity

```php
$pet = $client->Pet();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Pet()->load(["id" => "pet_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PetEntity`

Create a new `PetEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## QuestEntity

```php
$quest = $client->Quest();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Quest()->load(["id" => "quest_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): QuestEntity`

Create a new `QuestEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## SystemEntity

```php
$system = $client->System();
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

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->System()->load(["id" => "system_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): SystemEntity`

Create a new `SystemEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## TipEntity

```php
$tip = $client->Tip();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Tip()->load(["id" => "tip_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): TipEntity`

Create a new `TipEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## WznEntity

```php
$wzn = $client->Wzn();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Wzn()->load(["id" => "wzn_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): WznEntity`

Create a new `WznEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Wzn2Entity

```php
$wzn2 = $client->Wzn2();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Wzn2()->load(["id" => "wzn2_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): Wzn2Entity`

Create a new `Wzn2Entity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Wzn3Entity

```php
$wzn3 = $client->Wzn3();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Wzn3()->load(["id" => "wzn3_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): Wzn3Entity`

Create a new `Wzn3Entity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Wzn4Entity

```php
$wzn4 = $client->Wzn4();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Wzn4()->load(["id" => "wzn4_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): Wzn4Entity`

Create a new `Wzn4Entity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Wzn5Entity

```php
$wzn5 = $client->Wzn5();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Wzn5()->load(["id" => "wzn5_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): Wzn5Entity`

Create a new `Wzn5Entity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Wzn6Entity

```php
$wzn6 = $client->Wzn6();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->Wzn6()->load(["id" => "wzn6_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): Wzn6Entity`

Create a new `Wzn6Entity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## ZMapEntity

```php
$z_map = $client->ZMap();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): array`

Load a single entity matching the given criteria.

```php
[$result, $err] = $client->ZMap()->load(["id" => "z_map_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): ZMapEntity`

Create a new `ZMapEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new MaplestorySDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

