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



-- Idiomatic facade: client:android():list() / client:android():load({ id = ... })
function MaplestorySDK:android(data)
  local EntityMod = require("entity.android_entity")
  if data == nil then
    if self._android == nil then
      self._android = EntityMod.new(self, nil)
    end
    return self._android
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:android() instead.
function MaplestorySDK:Android(data)
  local EntityMod = require("entity.android_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:avatar():list() / client:avatar():load({ id = ... })
function MaplestorySDK:avatar(data)
  local EntityMod = require("entity.avatar_entity")
  if data == nil then
    if self._avatar == nil then
      self._avatar = EntityMod.new(self, nil)
    end
    return self._avatar
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:avatar() instead.
function MaplestorySDK:Avatar(data)
  local EntityMod = require("entity.avatar_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:cache():list() / client:cache():load({ id = ... })
function MaplestorySDK:cache(data)
  local EntityMod = require("entity.cache_entity")
  if data == nil then
    if self._cache == nil then
      self._cache = EntityMod.new(self, nil)
    end
    return self._cache
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:cache() instead.
function MaplestorySDK:Cache(data)
  local EntityMod = require("entity.cache_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:character():list() / client:character():load({ id = ... })
function MaplestorySDK:character(data)
  local EntityMod = require("entity.character_entity")
  if data == nil then
    if self._character == nil then
      self._character = EntityMod.new(self, nil)
    end
    return self._character
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:character() instead.
function MaplestorySDK:Character(data)
  local EntityMod = require("entity.character_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:chat():list() / client:chat():load({ id = ... })
function MaplestorySDK:chat(data)
  local EntityMod = require("entity.chat_entity")
  if data == nil then
    if self._chat == nil then
      self._chat = EntityMod.new(self, nil)
    end
    return self._chat
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:chat() instead.
function MaplestorySDK:Chat(data)
  local EntityMod = require("entity.chat_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:cluster():list() / client:cluster():load({ id = ... })
function MaplestorySDK:cluster(data)
  local EntityMod = require("entity.cluster_entity")
  if data == nil then
    if self._cluster == nil then
      self._cluster = EntityMod.new(self, nil)
    end
    return self._cluster
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:cluster() instead.
function MaplestorySDK:Cluster(data)
  local EntityMod = require("entity.cluster_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:diff():list() / client:diff():load({ id = ... })
function MaplestorySDK:diff(data)
  local EntityMod = require("entity.diff_entity")
  if data == nil then
    if self._diff == nil then
      self._diff = EntityMod.new(self, nil)
    end
    return self._diff
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:diff() instead.
function MaplestorySDK:Diff(data)
  local EntityMod = require("entity.diff_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:entity1():list() / client:entity1():load({ id = ... })
function MaplestorySDK:entity1(data)
  local EntityMod = require("entity.entity1_entity")
  if data == nil then
    if self._entity1 == nil then
      self._entity1 = EntityMod.new(self, nil)
    end
    return self._entity1
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:entity1() instead.
function MaplestorySDK:Entity1(data)
  local EntityMod = require("entity.entity1_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:gms_new():list() / client:gms_new():load({ id = ... })
function MaplestorySDK:gms_new(data)
  local EntityMod = require("entity.gms_new_entity")
  if data == nil then
    if self._gms_new == nil then
      self._gms_new = EntityMod.new(self, nil)
    end
    return self._gms_new
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:gms_new() instead.
function MaplestorySDK:GmsNew(data)
  local EntityMod = require("entity.gms_new_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:guild_mark():list() / client:guild_mark():load({ id = ... })
function MaplestorySDK:guild_mark(data)
  local EntityMod = require("entity.guild_mark_entity")
  if data == nil then
    if self._guild_mark == nil then
      self._guild_mark = EntityMod.new(self, nil)
    end
    return self._guild_mark
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:guild_mark() instead.
function MaplestorySDK:GuildMark(data)
  local EntityMod = require("entity.guild_mark_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:health():list() / client:health():load({ id = ... })
function MaplestorySDK:health(data)
  local EntityMod = require("entity.health_entity")
  if data == nil then
    if self._health == nil then
      self._health = EntityMod.new(self, nil)
    end
    return self._health
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:health() instead.
function MaplestorySDK:Health(data)
  local EntityMod = require("entity.health_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:item():list() / client:item():load({ id = ... })
function MaplestorySDK:item(data)
  local EntityMod = require("entity.item_entity")
  if data == nil then
    if self._item == nil then
      self._item = EntityMod.new(self, nil)
    end
    return self._item
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:item() instead.
function MaplestorySDK:Item(data)
  local EntityMod = require("entity.item_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:job():list() / client:job():load({ id = ... })
function MaplestorySDK:job(data)
  local EntityMod = require("entity.job_entity")
  if data == nil then
    if self._job == nil then
      self._job = EntityMod.new(self, nil)
    end
    return self._job
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:job() instead.
function MaplestorySDK:Job(data)
  local EntityMod = require("entity.job_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:map():list() / client:map():load({ id = ... })
function MaplestorySDK:map(data)
  local EntityMod = require("entity.map_entity")
  if data == nil then
    if self._map == nil then
      self._map = EntityMod.new(self, nil)
    end
    return self._map
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:map() instead.
function MaplestorySDK:Map(data)
  local EntityMod = require("entity.map_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:metric():list() / client:metric():load({ id = ... })
function MaplestorySDK:metric(data)
  local EntityMod = require("entity.metric_entity")
  if data == nil then
    if self._metric == nil then
      self._metric = EntityMod.new(self, nil)
    end
    return self._metric
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:metric() instead.
function MaplestorySDK:Metric(data)
  local EntityMod = require("entity.metric_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:mob():list() / client:mob():load({ id = ... })
function MaplestorySDK:mob(data)
  local EntityMod = require("entity.mob_entity")
  if data == nil then
    if self._mob == nil then
      self._mob = EntityMod.new(self, nil)
    end
    return self._mob
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:mob() instead.
function MaplestorySDK:Mob(data)
  local EntityMod = require("entity.mob_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:music():list() / client:music():load({ id = ... })
function MaplestorySDK:music(data)
  local EntityMod = require("entity.music_entity")
  if data == nil then
    if self._music == nil then
      self._music = EntityMod.new(self, nil)
    end
    return self._music
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:music() instead.
function MaplestorySDK:Music(data)
  local EntityMod = require("entity.music_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:name():list() / client:name():load({ id = ... })
function MaplestorySDK:name(data)
  local EntityMod = require("entity.name_entity")
  if data == nil then
    if self._name == nil then
      self._name = EntityMod.new(self, nil)
    end
    return self._name
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:name() instead.
function MaplestorySDK:Name(data)
  local EntityMod = require("entity.name_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:npc():list() / client:npc():load({ id = ... })
function MaplestorySDK:npc(data)
  local EntityMod = require("entity.npc_entity")
  if data == nil then
    if self._npc == nil then
      self._npc = EntityMod.new(self, nil)
    end
    return self._npc
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:npc() instead.
function MaplestorySDK:Npc(data)
  local EntityMod = require("entity.npc_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:nxf():list() / client:nxf():load({ id = ... })
function MaplestorySDK:nxf(data)
  local EntityMod = require("entity.nxf_entity")
  if data == nil then
    if self._nxf == nil then
      self._nxf = EntityMod.new(self, nil)
    end
    return self._nxf
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:nxf() instead.
function MaplestorySDK:Nxf(data)
  local EntityMod = require("entity.nxf_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:performance_metric():list() / client:performance_metric():load({ id = ... })
function MaplestorySDK:performance_metric(data)
  local EntityMod = require("entity.performance_metric_entity")
  if data == nil then
    if self._performance_metric == nil then
      self._performance_metric = EntityMod.new(self, nil)
    end
    return self._performance_metric
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:performance_metric() instead.
function MaplestorySDK:PerformanceMetric(data)
  local EntityMod = require("entity.performance_metric_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:pet():list() / client:pet():load({ id = ... })
function MaplestorySDK:pet(data)
  local EntityMod = require("entity.pet_entity")
  if data == nil then
    if self._pet == nil then
      self._pet = EntityMod.new(self, nil)
    end
    return self._pet
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:pet() instead.
function MaplestorySDK:Pet(data)
  local EntityMod = require("entity.pet_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:quest():list() / client:quest():load({ id = ... })
function MaplestorySDK:quest(data)
  local EntityMod = require("entity.quest_entity")
  if data == nil then
    if self._quest == nil then
      self._quest = EntityMod.new(self, nil)
    end
    return self._quest
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:quest() instead.
function MaplestorySDK:Quest(data)
  local EntityMod = require("entity.quest_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:system():list() / client:system():load({ id = ... })
function MaplestorySDK:system(data)
  local EntityMod = require("entity.system_entity")
  if data == nil then
    if self._system == nil then
      self._system = EntityMod.new(self, nil)
    end
    return self._system
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:system() instead.
function MaplestorySDK:System(data)
  local EntityMod = require("entity.system_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:tip():list() / client:tip():load({ id = ... })
function MaplestorySDK:tip(data)
  local EntityMod = require("entity.tip_entity")
  if data == nil then
    if self._tip == nil then
      self._tip = EntityMod.new(self, nil)
    end
    return self._tip
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:tip() instead.
function MaplestorySDK:Tip(data)
  local EntityMod = require("entity.tip_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:wzn():list() / client:wzn():load({ id = ... })
function MaplestorySDK:wzn(data)
  local EntityMod = require("entity.wzn_entity")
  if data == nil then
    if self._wzn == nil then
      self._wzn = EntityMod.new(self, nil)
    end
    return self._wzn
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:wzn() instead.
function MaplestorySDK:Wzn(data)
  local EntityMod = require("entity.wzn_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:wzn2():list() / client:wzn2():load({ id = ... })
function MaplestorySDK:wzn2(data)
  local EntityMod = require("entity.wzn2_entity")
  if data == nil then
    if self._wzn2 == nil then
      self._wzn2 = EntityMod.new(self, nil)
    end
    return self._wzn2
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:wzn2() instead.
function MaplestorySDK:Wzn2(data)
  local EntityMod = require("entity.wzn2_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:wzn3():list() / client:wzn3():load({ id = ... })
function MaplestorySDK:wzn3(data)
  local EntityMod = require("entity.wzn3_entity")
  if data == nil then
    if self._wzn3 == nil then
      self._wzn3 = EntityMod.new(self, nil)
    end
    return self._wzn3
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:wzn3() instead.
function MaplestorySDK:Wzn3(data)
  local EntityMod = require("entity.wzn3_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:wzn4():list() / client:wzn4():load({ id = ... })
function MaplestorySDK:wzn4(data)
  local EntityMod = require("entity.wzn4_entity")
  if data == nil then
    if self._wzn4 == nil then
      self._wzn4 = EntityMod.new(self, nil)
    end
    return self._wzn4
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:wzn4() instead.
function MaplestorySDK:Wzn4(data)
  local EntityMod = require("entity.wzn4_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:wzn5():list() / client:wzn5():load({ id = ... })
function MaplestorySDK:wzn5(data)
  local EntityMod = require("entity.wzn5_entity")
  if data == nil then
    if self._wzn5 == nil then
      self._wzn5 = EntityMod.new(self, nil)
    end
    return self._wzn5
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:wzn5() instead.
function MaplestorySDK:Wzn5(data)
  local EntityMod = require("entity.wzn5_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:wzn6():list() / client:wzn6():load({ id = ... })
function MaplestorySDK:wzn6(data)
  local EntityMod = require("entity.wzn6_entity")
  if data == nil then
    if self._wzn6 == nil then
      self._wzn6 = EntityMod.new(self, nil)
    end
    return self._wzn6
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:wzn6() instead.
function MaplestorySDK:Wzn6(data)
  local EntityMod = require("entity.wzn6_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:z_map():list() / client:z_map():load({ id = ... })
function MaplestorySDK:z_map(data)
  local EntityMod = require("entity.z_map_entity")
  if data == nil then
    if self._z_map == nil then
      self._z_map = EntityMod.new(self, nil)
    end
    return self._z_map
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:z_map() instead.
function MaplestorySDK:ZMap(data)
  local EntityMod = require("entity.z_map_entity")
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
