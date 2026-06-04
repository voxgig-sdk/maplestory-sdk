# Maplestory SDK

Community-run access to MapleStory game data and rendered sprites across regions and versions

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About MapleStory.IO

[MapleStory.IO](https://maplestory.io) is a community-maintained HTTP API that exposes MapleStory game data and rendered game assets. It is operated independently of NEXON and is described by its author as "provided out of love towards the MapleStory community and with a focus on building positive gaming experiences".

The service indexes the game's WZ data files across multiple regions and client versions (for example `GMS` and other regional builds), and serves both structured game data and pre-rendered images.

What you can fetch through the API:
- Lists of supported regions and versions via `GET /api/wz`
- Game objects such as NPCs, mobs, items, maps, jobs, quests, pets, and music, scoped to a region/version (e.g. `GET /api/GMS/{version}/npc/{id}`)
- Rendered sprite images for entities (e.g. `GET /api/GMS/{version}/mob/{id}/render/stand`)
- UI assets and icons drawn from the game's WZ image bundles (e.g. `/api/wz/img/GMS/{version}/UI/...`)

Operational notes: the upstream community monitor reports high uptime and sub-200ms average response times, but the service does not enable CORS and provides no documented authentication or formal rate-limit policy. Treat both the data and the endpoint shape as community-best-effort.

## Try it

**TypeScript**
```bash
npm install maplestory
```

**Python**
```bash
pip install maplestory-sdk
```

**PHP**
```bash
composer require voxgig/maplestory-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/maplestory-sdk/go
```

**Ruby**
```bash
gem install maplestory-sdk
```

**Lua**
```bash
luarocks install maplestory-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { MaplestorySDK } from 'maplestory'

const client = new MaplestorySDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o maplestory-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "maplestory": {
      "command": "/abs/path/to/maplestory-mcp"
    }
  }
}
```

## Entities

The API exposes 32 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Android** | MapleStory android companion data and renders, scoped by region and version. | `/api/{region}/{version}/android/{androidId}` |
| **Avatar** | Composed character/avatar renders assembled from equipment and appearance parameters. | `/api/character/{items}/{animation}/animated` |
| **Cache** | Cache control / cache status endpoints used by the upstream service. | `/api/metrics/cache` |
| **Character** | Character appearance and rendering endpoints used to compose avatars from equipped items. | `/api/{region}/{version}/Character/animated/{skinId}/{items}/{animation}/{frame}` |
| **Chat** | Chat-related game resources surfaced by the upstream WZ data. | `/api/{region}/{version}/chat` |
| **Cluster** | Internal clustering / sharding endpoints exposed by the service. | `/api/metrics/cluster` |
| **Diff** | Endpoints that compare game data between versions or regions. | `/api/{region}/{version}/diff` |
| **Entity1** | Generic entity lookup grouping exposed by the upstream WZ schema. | `/` |
| **GmsNew** | Endpoints scoped to newer GMS (Global MapleStory) client builds. | `/api/gms/latest/news/article/{id}` |
| **GuildMark** | Guild emblem / guild mark image resources. | `/api/{region}/{version}/GuildMark/background/{guildBackgroundId}/{guildBackgroundColorId}/mark/{guildMarkId}/{guildMarkColorId}` |
| **Health** | Service health and status endpoints for the upstream monitor. | `/api/health/alive` |
| **Item** | Item definitions, stats, icons, and renders (e.g. `/api/{region}/{version}/item/{id}`). | `/api/{region}/{version}/item` |
| **Job** | MapleStory job/class metadata and associated assets. | `/api/{region}/{version}/job/{jobId}/skillbook/{skillId}` |
| **Map** | In-game maps, including map metadata and rendered map imagery. | `/api/{region}/{version}/map/{mapId}/render/layer/{layer}/{frame}` |
| **Metric** | Operational metrics exposed by the service. | `/api/metrics/health` |
| **Mob** | Monster (mob) definitions and sprite renders (e.g. `/api/{region}/{version}/mob/{id}/render/stand`). | `/api/{region}/{version}/mob` |
| **Music** | Background music tracks bundled with the game's WZ data. | `/api/{region}/{version}/music/{songPath}` |
| **Name** | Name lookup / search helpers across game entities. | `/api/{region}/{version}/name` |
| **Npc** | NPC definitions, dialogue references, and sprite renders (e.g. `/api/{region}/{version}/npc/{id}/render/stand`). | `/api/{region}/{version}/npc/{npcId}/render/animated/{framebook}` |
| **Nxf** | NXF-format asset endpoints used by newer client builds. | `/api/about` |
| **PerformanceMetric** | Performance telemetry endpoints for the service. | `/api/metrics` |
| **Pet** | Pet definitions and sprite renders. | `/api/{region}/{version}/pet/{petId}/render/{animation}/{frame}/{petEquip}` |
| **Quest** | Quest metadata including objectives, rewards, and related references. | `/api/{region}/{version}/quest` |
| **System** | System / administrative endpoints exposed by the service. | `/api/metrics/system` |
| **Tip** | Loading-screen tips and similar miscellaneous text resources. | `/api/{region}/{version}/tips` |
| **Wzn** | Endpoints over the WZ/WZN packed asset format used by MapleStory clients. | `/api/wz` |
| **Wzn2** | Second-generation WZN asset endpoints for newer client builds. | `/api/wz/audio/{region}/{version}/{path}` |
| **Wzn3** | Third-generation WZN asset endpoints. | `/api/wz/export/{region}/{version}/{path}` |
| **Wzn4** | Fourth-generation WZN asset endpoints. | `/api/wz/img/{region}/{version}/{path}` |
| **Wzn5** | Fifth-generation WZN asset endpoints. | `/api/wz/lookup/{region}/{version}/{path}` |
| **Wzn6** | Sixth-generation WZN asset endpoints. | `/api/wz/{region}/{version}/{path}` |
| **ZMap** | Auxiliary map data / index endpoints (the `z_` prefix indicates a secondary grouping in the upstream schema). | `/api/{region}/{version}/zmap` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from maplestory_sdk import MaplestorySDK

client = MaplestorySDK({})


# Load a specific android
android, err = client.Android(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'maplestory_sdk.php';

$client = new MaplestorySDK([]);


// Load a specific android
[$android, $err] = $client->Android(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/maplestory-sdk/go"

client := sdk.NewMaplestorySDK(map[string]any{})

```

### Ruby

```ruby
require_relative "Maplestory_sdk"

client = MaplestorySDK.new({})


# Load a specific android
android, err = client.Android(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("maplestory_sdk")

local client = sdk.new({})


-- Load a specific android
local android, err = client:Android(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = MaplestorySDK.test()
const result = await client.Android().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = MaplestorySDK.test(None, None)
result, err = client.Android(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = MaplestorySDK::test(null, null);
[$result, $err] = $client->Android(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Android(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = MaplestorySDK.test(nil, nil)
result, err = client.Android(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Android(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
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

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
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

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the MapleStory.IO

- Upstream: [https://maplestory.io](https://maplestory.io)

- The API itself is provided as a free community service with no explicit licence.
- All media, icons, descriptions, and character information are the sole property of NEXON.
- Use of returned assets is governed by NEXON's Terms of Service.
- CORS is disabled on the upstream service; requests typically need to be proxied for browser use.

---

Generated from the MapleStory.IO OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
