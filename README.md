# Maplestory SDK



Available for [Golang](go/) and [Lua](lua/) and [PHP](php/) and [Python](py/) and [Ruby](rb/) and [TypeScript](ts/).


## Entities

The API exposes 32 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Android** |  | `/api/{region}/{version}/android/{androidId}` |
| **Avatar** |  | `/api/character/{items}/{animation}/animated` |
| **Cache** |  | `/api/metrics/cache` |
| **Character** |  | `/api/{region}/{version}/Character/animated/{skinId}/{items}/{animation}/{frame}` |
| **Chat** |  | `/api/{region}/{version}/chat` |
| **Cluster** |  | `/api/metrics/cluster` |
| **Diff** |  | `/api/{region}/{version}/diff` |
| **Entity1** |  | `/` |
| **GmsNew** |  | `/api/gms/latest/news/article/{id}` |
| **GuildMark** |  | `/api/{region}/{version}/GuildMark/background/{guildBackgroundId}/{guildBackgroundColorId}/mark/{guildMarkId}/{guildMarkColorId}` |
| **Health** |  | `/api/health/alive` |
| **Item** |  | `/api/{region}/{version}/item` |
| **Job** |  | `/api/{region}/{version}/job/{jobId}/skillbook/{skillId}` |
| **Map** |  | `/api/{region}/{version}/map/{mapId}/render/layer/{layer}/{frame}` |
| **Metric** |  | `/api/metrics/health` |
| **Mob** |  | `/api/{region}/{version}/mob` |
| **Music** |  | `/api/{region}/{version}/music/{songPath}` |
| **Name** |  | `/api/{region}/{version}/name` |
| **Npc** |  | `/api/{region}/{version}/npc/{npcId}/render/animated/{framebook}` |
| **Nxf** |  | `/api/about` |
| **PerformanceMetric** |  | `/api/metrics` |
| **Pet** |  | `/api/{region}/{version}/pet/{petId}/render/{animation}/{frame}/{petEquip}` |
| **Quest** |  | `/api/{region}/{version}/quest` |
| **System** |  | `/api/metrics/system` |
| **Tip** |  | `/api/{region}/{version}/tips` |
| **Wzn** |  | `/api/wz` |
| **Wzn2** |  | `/api/wz/audio/{region}/{version}/{path}` |
| **Wzn3** |  | `/api/wz/export/{region}/{version}/{path}` |
| **Wzn4** |  | `/api/wz/img/{region}/{version}/{path}` |
| **Wzn5** |  | `/api/wz/lookup/{region}/{version}/{path}` |
| **Wzn6** |  | `/api/wz/{region}/{version}/{path}` |
| **ZMap** |  | `/api/{region}/{version}/zmap` |

Each entity supports the following operations where available: **load**, **list**, **create**,
**update**, and **remove**.


## Architecture

### Entity-operation model

Every SDK call follows the same pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

At each stage a feature hook fires (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), allowing features to inspect or modify the pipeline.

### Features

Features are hook-based middleware that extend SDK behaviour.

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

You can add custom features by passing them in the `extend` option at
construction time.

### Direct and Prepare

For endpoints not covered by the entity model, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`, `headers`,
and `body`.


## Quick start

### Golang

```go
import sdk "github.com/voxgig-sdk/maplestory-sdk"

client := sdk.NewMaplestorySDK(map[string]any{
    "apikey": os.Getenv("MAPLESTORY_APIKEY"),
})

```

### Lua

```lua
local sdk = require("maplestory_sdk")

local client = sdk.new({
  apikey = os.getenv("MAPLESTORY_APIKEY"),
})


-- Load a specific android
local android, err = client:Android(nil):load(
  { id = "example_id" }, nil
)
```

### PHP

```php
<?php
require_once 'maplestory_sdk.php';

$client = new MaplestorySDK([
    "apikey" => getenv("MAPLESTORY_APIKEY"),
]);


// Load a specific android
[$android, $err] = $client->Android(null)->load(
    ["id" => "example_id"], null
);
```

### Python

```python
import os
from maplestory_sdk import MaplestorySDK

client = MaplestorySDK({
    "apikey": os.environ.get("MAPLESTORY_APIKEY"),
})


# Load a specific android
android, err = client.Android(None).load(
    {"id": "example_id"}, None
)
```

### Ruby

```ruby
require_relative "Maplestory_sdk"

client = MaplestorySDK.new({
  "apikey" => ENV["MAPLESTORY_APIKEY"],
})


# Load a specific android
android, err = client.Android(nil).load(
  { "id" => "example_id" }, nil
)
```

### TypeScript

```ts
import { MaplestorySDK } from 'maplestory'

const client = new MaplestorySDK({
  apikey: process.env.MAPLESTORY_APIKEY,
})

```


## Testing

Both SDKs provide a test mode that replaces the HTTP transport with an
in-memory mock, so tests run without a network connection.

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Android(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Android(nil):load(
  { id = "test01" }, nil
)
```

### PHP

```php
$client = MaplestorySDK::test(null, null);
[$result, $err] = $client->Android(null)->load(
    ["id" => "test01"], null
);
```

### Python

```python
client = MaplestorySDK.test(None, None)
result, err = client.Android(None).load(
    {"id": "test01"}, None
)
```

### Ruby

```ruby
client = MaplestorySDK.test(nil, nil)
result, err = client.Android(nil).load(
  { "id" => "test01" }, nil
)
```

### TypeScript

```ts
const client = MaplestorySDK.test()
const result = await client.Android().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```


## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```


## Language-specific documentation

- [Golang SDK](go/README.md)
- [Lua SDK](lua/README.md)
- [PHP SDK](php/README.md)
- [Python SDK](py/README.md)
- [Ruby SDK](rb/README.md)
- [TypeScript SDK](ts/README.md)

