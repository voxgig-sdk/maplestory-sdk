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



function MaplestorySDK:Android(data)
  local EntityMod = require("entity.android_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Avatar(data)
  local EntityMod = require("entity.avatar_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Cache(data)
  local EntityMod = require("entity.cache_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Character(data)
  local EntityMod = require("entity.character_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Chat(data)
  local EntityMod = require("entity.chat_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Cluster(data)
  local EntityMod = require("entity.cluster_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Diff(data)
  local EntityMod = require("entity.diff_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Entity1(data)
  local EntityMod = require("entity.entity1_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:GmsNew(data)
  local EntityMod = require("entity.gms_new_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:GuildMark(data)
  local EntityMod = require("entity.guild_mark_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Health(data)
  local EntityMod = require("entity.health_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Item(data)
  local EntityMod = require("entity.item_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Job(data)
  local EntityMod = require("entity.job_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Map(data)
  local EntityMod = require("entity.map_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Metric(data)
  local EntityMod = require("entity.metric_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Mob(data)
  local EntityMod = require("entity.mob_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Music(data)
  local EntityMod = require("entity.music_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Name(data)
  local EntityMod = require("entity.name_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Npc(data)
  local EntityMod = require("entity.npc_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Nxf(data)
  local EntityMod = require("entity.nxf_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:PerformanceMetric(data)
  local EntityMod = require("entity.performance_metric_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Pet(data)
  local EntityMod = require("entity.pet_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Quest(data)
  local EntityMod = require("entity.quest_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:System(data)
  local EntityMod = require("entity.system_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Tip(data)
  local EntityMod = require("entity.tip_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Wzn(data)
  local EntityMod = require("entity.wzn_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Wzn2(data)
  local EntityMod = require("entity.wzn2_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Wzn3(data)
  local EntityMod = require("entity.wzn3_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Wzn4(data)
  local EntityMod = require("entity.wzn4_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Wzn5(data)
  local EntityMod = require("entity.wzn5_entity")
  return EntityMod.new(self, data)
end


function MaplestorySDK:Wzn6(data)
  local EntityMod = require("entity.wzn6_entity")
  return EntityMod.new(self, data)
end


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
