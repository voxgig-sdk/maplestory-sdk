-- Maplestory SDK

local vs = require("utility.struct.struct")
local Utility = require("core.utility_type")
local Spec = require("core.spec")
local helpers = require("core.helpers")

-- Load utility registration (populates Utility._registrar)
require("utility.register")

-- Load features
local BaseFeature = require("feature.base_feature")
local features_factory = require("features")


local MaplestorySDK = {}
MaplestorySDK.__index = MaplestorySDK


local function _make_feature(name)
  local factory = features_factory[name]
  if factory ~= nil then
    return factory()
  end
  return features_factory.base()
end

MaplestorySDK._make_feature = _make_feature


function MaplestorySDK.new(options)
  local self = setmetatable({}, MaplestorySDK)
  self.mode = "live"
  self.features = {}
  self.options = nil

  local utility = Utility.new()
  self._utility = utility

  local config = require("config")()

  self._rootctx = utility.make_context({
    client = self,
    utility = utility,
    config = config,
    options = options or {},
    shared = {},
  }, nil)

  self.options = utility.make_options(self._rootctx)

  if vs.getpath(self.options, "feature.test.active") == true then
    self.mode = "test"
  end

  self._rootctx.options = self.options

  -- Add features from config.
  local feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
  if feature_opts ~= nil then
    local feature_items = vs.items(feature_opts)
    if feature_items ~= nil then
      for _, item in ipairs(feature_items) do
        local fname = item[1]
        local fopts = helpers.to_map(item[2])
        if fopts ~= nil and fopts["active"] == true then
          utility.feature_add(self._rootctx, _make_feature(fname))
        end
      end
    end
  end

  -- Add extension features.
  local extend = vs.getprop(self.options, "extend")
  if type(extend) == "table" then
    for _, f in ipairs(extend) do
      if type(f) == "table" and type(f.get_name) == "function" then
        utility.feature_add(self._rootctx, f)
      end
    end
  end

  -- Initialize features.
  for _, f in ipairs(self.features) do
    utility.feature_init(self._rootctx, f)
  end

  utility.feature_hook(self._rootctx, "PostConstruct")

  -- #BuildFeatures

  return self
end


function MaplestorySDK:options_map()
  local out = vs.clone(self.options)
  if type(out) == "table" then
    return out
  end
  return {}
end


function MaplestorySDK:get_utility()
  return Utility.copy(self._utility)
end


function MaplestorySDK:get_root_ctx()
  return self._rootctx
end


function MaplestorySDK:prepare(fetchargs)
  local utility = self._utility

  fetchargs = fetchargs or {}

  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "prepare",
    ctrl = ctrl,
  }, self._rootctx)

  local options = self.options

  local path = vs.getprop(fetchargs, "path") or ""
  if type(path) ~= "string" then path = "" end

  local method = vs.getprop(fetchargs, "method") or "GET"
  if type(method) ~= "string" then method = "GET" end

  local params = helpers.to_map(vs.getprop(fetchargs, "params")) or {}
  local query = helpers.to_map(vs.getprop(fetchargs, "query")) or {}

  local headers = utility.prepare_headers(ctx)

  local base = vs.getprop(options, "base") or ""
  if type(base) ~= "string" then base = "" end
  local prefix = vs.getprop(options, "prefix") or ""
  if type(prefix) ~= "string" then prefix = "" end
  local suffix = vs.getprop(options, "suffix") or ""
  if type(suffix) ~= "string" then suffix = "" end

  ctx.spec = Spec.new({
    base = base,
    prefix = prefix,
    suffix = suffix,
    path = path,
    method = method,
    params = params,
    query = query,
    headers = headers,
    body = vs.getprop(fetchargs, "body"),
    step = "start",
  })

  -- Merge user-provided headers.
  local uh = vs.getprop(fetchargs, "headers")
  if type(uh) == "table" then
    for k, v in pairs(uh) do
      ctx.spec.headers[k] = v
    end
  end

  local _, err = utility.prepare_auth(ctx)
  if err ~= nil then
    return nil, err
  end

  return utility.make_fetch_def(ctx)
end


function MaplestorySDK:direct(fetchargs)
  local utility = self._utility

  local fetchdef, err = self:prepare(fetchargs)
  if err ~= nil then
    return { ok = false, err = err }, nil
  end

  fetchargs = fetchargs or {}
  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "direct",
    ctrl = ctrl,
  }, self._rootctx)

  local url = fetchdef["url"] or ""
  local fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

  if fetch_err ~= nil then
    return { ok = false, err = fetch_err }, nil
  end

  if fetched == nil then
    return {
      ok = false,
      err = ctx:make_error("direct_no_response", "response: undefined"),
    }, nil
  end

  if type(fetched) == "table" then
    local status = helpers.to_int(vs.getprop(fetched, "status"))
    local headers = vs.getprop(fetched, "headers") or {}

    -- No-body responses (204, 304) and explicit zero content-length
    -- must skip JSON parsing — calling json() on an empty body errors.
    local content_length = nil
    if type(headers) == "table" then
      content_length = headers["content-length"]
    end
    local no_body = status == 204 or status == 304 or tostring(content_length) == "0"

    local json_data = nil
    if not no_body then
      local jf = vs.getprop(fetched, "json")
      if type(jf) == "function" then
        local ok, result = pcall(jf)
        if ok then
          json_data = result
        end
        -- Non-JSON body: json_data stays nil, status/headers preserved.
      end
    end

    return {
      ok = status >= 200 and status < 300,
      status = status,
      headers = headers,
      data = json_data,
    }, nil
  end

  return {
    ok = false,
    err = ctx:make_error("direct_invalid", "invalid response type"),
  }, nil
end



-- Idiomatic facade: client:Android():list() / client:Android():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Android(data)
  local EntityMod = require("entity.android_entity")
  if data == nil then
    if self._android == nil then
      self._android = EntityMod.new(self, nil)
    end
    return self._android
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Avatar():list() / client:Avatar():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Avatar(data)
  local EntityMod = require("entity.avatar_entity")
  if data == nil then
    if self._avatar == nil then
      self._avatar = EntityMod.new(self, nil)
    end
    return self._avatar
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Cache():list() / client:Cache():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Cache(data)
  local EntityMod = require("entity.cache_entity")
  if data == nil then
    if self._cache == nil then
      self._cache = EntityMod.new(self, nil)
    end
    return self._cache
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Character():list() / client:Character():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Character(data)
  local EntityMod = require("entity.character_entity")
  if data == nil then
    if self._character == nil then
      self._character = EntityMod.new(self, nil)
    end
    return self._character
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Chat():list() / client:Chat():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Chat(data)
  local EntityMod = require("entity.chat_entity")
  if data == nil then
    if self._chat == nil then
      self._chat = EntityMod.new(self, nil)
    end
    return self._chat
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Cluster():list() / client:Cluster():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Cluster(data)
  local EntityMod = require("entity.cluster_entity")
  if data == nil then
    if self._cluster == nil then
      self._cluster = EntityMod.new(self, nil)
    end
    return self._cluster
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Diff():list() / client:Diff():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Diff(data)
  local EntityMod = require("entity.diff_entity")
  if data == nil then
    if self._diff == nil then
      self._diff = EntityMod.new(self, nil)
    end
    return self._diff
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Entity1():list() / client:Entity1():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Entity1(data)
  local EntityMod = require("entity.entity1_entity")
  if data == nil then
    if self._entity1 == nil then
      self._entity1 = EntityMod.new(self, nil)
    end
    return self._entity1
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:GmsNew():list() / client:GmsNew():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:GmsNew(data)
  local EntityMod = require("entity.gms_new_entity")
  if data == nil then
    if self._gms_new == nil then
      self._gms_new = EntityMod.new(self, nil)
    end
    return self._gms_new
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:GuildMark():list() / client:GuildMark():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:GuildMark(data)
  local EntityMod = require("entity.guild_mark_entity")
  if data == nil then
    if self._guild_mark == nil then
      self._guild_mark = EntityMod.new(self, nil)
    end
    return self._guild_mark
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Health():list() / client:Health():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Health(data)
  local EntityMod = require("entity.health_entity")
  if data == nil then
    if self._health == nil then
      self._health = EntityMod.new(self, nil)
    end
    return self._health
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Item():list() / client:Item():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Item(data)
  local EntityMod = require("entity.item_entity")
  if data == nil then
    if self._item == nil then
      self._item = EntityMod.new(self, nil)
    end
    return self._item
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Job():list() / client:Job():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Job(data)
  local EntityMod = require("entity.job_entity")
  if data == nil then
    if self._job == nil then
      self._job = EntityMod.new(self, nil)
    end
    return self._job
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Map():list() / client:Map():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Map(data)
  local EntityMod = require("entity.map_entity")
  if data == nil then
    if self._map == nil then
      self._map = EntityMod.new(self, nil)
    end
    return self._map
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Metric():list() / client:Metric():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Metric(data)
  local EntityMod = require("entity.metric_entity")
  if data == nil then
    if self._metric == nil then
      self._metric = EntityMod.new(self, nil)
    end
    return self._metric
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Mob():list() / client:Mob():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Mob(data)
  local EntityMod = require("entity.mob_entity")
  if data == nil then
    if self._mob == nil then
      self._mob = EntityMod.new(self, nil)
    end
    return self._mob
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Music():list() / client:Music():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Music(data)
  local EntityMod = require("entity.music_entity")
  if data == nil then
    if self._music == nil then
      self._music = EntityMod.new(self, nil)
    end
    return self._music
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Name():list() / client:Name():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Name(data)
  local EntityMod = require("entity.name_entity")
  if data == nil then
    if self._name == nil then
      self._name = EntityMod.new(self, nil)
    end
    return self._name
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Npc():list() / client:Npc():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Npc(data)
  local EntityMod = require("entity.npc_entity")
  if data == nil then
    if self._npc == nil then
      self._npc = EntityMod.new(self, nil)
    end
    return self._npc
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Nxf():list() / client:Nxf():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Nxf(data)
  local EntityMod = require("entity.nxf_entity")
  if data == nil then
    if self._nxf == nil then
      self._nxf = EntityMod.new(self, nil)
    end
    return self._nxf
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:PerformanceMetric():list() / client:PerformanceMetric():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:PerformanceMetric(data)
  local EntityMod = require("entity.performance_metric_entity")
  if data == nil then
    if self._performance_metric == nil then
      self._performance_metric = EntityMod.new(self, nil)
    end
    return self._performance_metric
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Pet():list() / client:Pet():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Pet(data)
  local EntityMod = require("entity.pet_entity")
  if data == nil then
    if self._pet == nil then
      self._pet = EntityMod.new(self, nil)
    end
    return self._pet
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Quest():list() / client:Quest():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Quest(data)
  local EntityMod = require("entity.quest_entity")
  if data == nil then
    if self._quest == nil then
      self._quest = EntityMod.new(self, nil)
    end
    return self._quest
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:System():list() / client:System():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:System(data)
  local EntityMod = require("entity.system_entity")
  if data == nil then
    if self._system == nil then
      self._system = EntityMod.new(self, nil)
    end
    return self._system
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Tip():list() / client:Tip():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Tip(data)
  local EntityMod = require("entity.tip_entity")
  if data == nil then
    if self._tip == nil then
      self._tip = EntityMod.new(self, nil)
    end
    return self._tip
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Wzn():list() / client:Wzn():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Wzn(data)
  local EntityMod = require("entity.wzn_entity")
  if data == nil then
    if self._wzn == nil then
      self._wzn = EntityMod.new(self, nil)
    end
    return self._wzn
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Wzn2():list() / client:Wzn2():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Wzn2(data)
  local EntityMod = require("entity.wzn2_entity")
  if data == nil then
    if self._wzn2 == nil then
      self._wzn2 = EntityMod.new(self, nil)
    end
    return self._wzn2
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Wzn3():list() / client:Wzn3():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Wzn3(data)
  local EntityMod = require("entity.wzn3_entity")
  if data == nil then
    if self._wzn3 == nil then
      self._wzn3 = EntityMod.new(self, nil)
    end
    return self._wzn3
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Wzn4():list() / client:Wzn4():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Wzn4(data)
  local EntityMod = require("entity.wzn4_entity")
  if data == nil then
    if self._wzn4 == nil then
      self._wzn4 = EntityMod.new(self, nil)
    end
    return self._wzn4
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Wzn5():list() / client:Wzn5():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Wzn5(data)
  local EntityMod = require("entity.wzn5_entity")
  if data == nil then
    if self._wzn5 == nil then
      self._wzn5 = EntityMod.new(self, nil)
    end
    return self._wzn5
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Wzn6():list() / client:Wzn6():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:Wzn6(data)
  local EntityMod = require("entity.wzn6_entity")
  if data == nil then
    if self._wzn6 == nil then
      self._wzn6 = EntityMod.new(self, nil)
    end
    return self._wzn6
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:ZMap():list() / client:ZMap():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function MaplestorySDK:ZMap(data)
  local EntityMod = require("entity.z_map_entity")
  if data == nil then
    if self._z_map == nil then
      self._z_map = EntityMod.new(self, nil)
    end
    return self._z_map
  end
  return EntityMod.new(self, data)
end




function MaplestorySDK.test(testopts, sdkopts)
  sdkopts = sdkopts or {}
  sdkopts = vs.clone(sdkopts)
  if type(sdkopts) ~= "table" then
    sdkopts = {}
  end

  testopts = testopts or {}
  testopts = vs.clone(testopts)
  if type(testopts) ~= "table" then
    testopts = {}
  end
  testopts["active"] = true

  vs.setpath(sdkopts, "feature.test", testopts)

  local sdk = MaplestorySDK.new(sdkopts)
  sdk.mode = "test"

  return sdk
end


return MaplestorySDK
