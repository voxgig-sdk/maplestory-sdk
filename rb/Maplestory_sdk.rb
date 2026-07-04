# Maplestory SDK

require_relative 'utility/struct/voxgig_struct'
require_relative 'core/utility_type'
require_relative 'core/spec'
require_relative 'core/helpers'

# Load utility registration
require_relative 'utility/register'

# Load config and features
require_relative 'config'
require_relative 'feature/base_feature'
require_relative 'features'

# Load typed models (Struct value objects).
require_relative 'Maplestory_types'


class MaplestorySDK
  attr_accessor :mode, :features, :options

  def initialize(options = {})
    @mode = "live"
    @features = []
    @options = nil

    utility = MaplestoryUtility.new
    @_utility = utility

    config = MaplestoryConfig.make_config

    @_rootctx = utility.make_context.call({
      "client" => self,
      "utility" => utility,
      "config" => config,
      "options" => options || {},
      "shared" => {},
    }, nil)

    @options = utility.make_options.call(@_rootctx)

    if VoxgigStruct.getpath(@options, "feature.test.active") == true
      @mode = "test"
    end

    @_rootctx.options = @options

    # Add features from config.
    feature_opts = MaplestoryHelpers.to_map(VoxgigStruct.getprop(@options, "feature"))
    if feature_opts
      items = VoxgigStruct.items(feature_opts)
      if items
        items.each do |item|
          fname = item[0]
          fopts = MaplestoryHelpers.to_map(item[1])
          if fopts && fopts["active"] == true
            utility.feature_add.call(@_rootctx, MaplestoryFeatures.make_feature(fname))
          end
        end
      end
    end

    # Add extension features.
    extend_val = VoxgigStruct.getprop(@options, "extend")
    if extend_val.is_a?(Array)
      extend_val.each do |f|
        if f.respond_to?(:get_name)
          utility.feature_add.call(@_rootctx, f)
        end
      end
    end

    # Initialize features.
    @features.each do |f|
      utility.feature_init.call(@_rootctx, f)
    end

    utility.feature_hook.call(@_rootctx, "PostConstruct")
  end

  def options_map
    out = VoxgigStruct.clone(@options)
    out.is_a?(Hash) ? out : {}
  end

  def get_utility
    MaplestoryUtility.copy(@_utility)
  end

  def get_root_ctx
    @_rootctx
  end

  def prepare(fetchargs = {})
    utility = @_utility
    fetchargs ||= {}

    ctrl = MaplestoryHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "prepare",
      "ctrl" => ctrl,
    }, @_rootctx)

    opts = @options
    path = VoxgigStruct.getprop(fetchargs, "path") || ""
    path = "" unless path.is_a?(String)
    method_val = VoxgigStruct.getprop(fetchargs, "method") || "GET"
    method_val = "GET" unless method_val.is_a?(String)
    params = MaplestoryHelpers.to_map(VoxgigStruct.getprop(fetchargs, "params")) || {}
    query = MaplestoryHelpers.to_map(VoxgigStruct.getprop(fetchargs, "query")) || {}
    headers = utility.prepare_headers.call(ctx)

    base = VoxgigStruct.getprop(opts, "base") || ""
    base = "" unless base.is_a?(String)
    prefix = VoxgigStruct.getprop(opts, "prefix") || ""
    prefix = "" unless prefix.is_a?(String)
    suffix = VoxgigStruct.getprop(opts, "suffix") || ""
    suffix = "" unless suffix.is_a?(String)

    ctx.spec = MaplestorySpec.new({
      "base" => base, "prefix" => prefix, "suffix" => suffix,
      "path" => path, "method" => method_val,
      "params" => params, "query" => query, "headers" => headers,
      "body" => VoxgigStruct.getprop(fetchargs, "body"),
      "step" => "start",
    })

    # Merge user-provided headers.
    uh = VoxgigStruct.getprop(fetchargs, "headers")
    if uh.is_a?(Hash)
      uh.each { |k, v| ctx.spec.headers[k] = v }
    end

    _, err = utility.prepare_auth.call(ctx)
    raise err if err

    utility.make_fetch_def.call(ctx)
  end

  def direct(fetchargs = {})
    utility = @_utility

    # direct() is the raw-HTTP escape hatch: it always returns a result hash
    # ({ "ok" => ..., ... }) and never raises. prepare() raises on error, so
    # trap that and surface it in the hash.
    begin
      fetchdef = prepare(fetchargs)
    rescue MaplestoryError => err
      return { "ok" => false, "err" => err }
    end

    fetchargs ||= {}
    ctrl = MaplestoryHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "direct",
      "ctrl" => ctrl,
    }, @_rootctx)

    url = fetchdef["url"] || ""
    fetched, fetch_err = utility.fetcher.call(ctx, url, fetchdef)

    return { "ok" => false, "err" => fetch_err } if fetch_err

    if fetched.nil?
      return {
        "ok" => false,
        "err" => ctx.make_error("direct_no_response", "response: undefined"),
      }
    end

    if fetched.is_a?(Hash)
      status = MaplestoryHelpers.to_int(VoxgigStruct.getprop(fetched, "status"))
      headers = VoxgigStruct.getprop(fetched, "headers") || {}

      # No-body responses (204, 304) and explicit zero content-length must
      # skip JSON parsing — calling json() on an empty body errors.
      content_length = headers.is_a?(Hash) ? headers["content-length"] : nil
      no_body = status == 204 || status == 304 || content_length.to_s == "0"

      json_data = nil
      unless no_body
        jf = VoxgigStruct.getprop(fetched, "json")
        if jf.is_a?(Proc)
          begin
            json_data = jf.call
          rescue StandardError
            # Non-JSON body — leave data nil, keep status/headers.
            json_data = nil
          end
        end
      end

      return {
        "ok" => status >= 200 && status < 300,
        "status" => status,
        "headers" => headers,
        "data" => json_data,
      }
    end

    return {
      "ok" => false,
      "err" => ctx.make_error("direct_invalid", "invalid response type"),
    }
  end


  # Canonical facade: client.Android.list / client.Android.load({ "id" => ... })
  def Android(data = nil)
    require_relative 'entity/android_entity'
    AndroidEntity.new(self, data)
  end


  # Canonical facade: client.Avatar.list / client.Avatar.load({ "id" => ... })
  def Avatar(data = nil)
    require_relative 'entity/avatar_entity'
    AvatarEntity.new(self, data)
  end


  # Canonical facade: client.Cache.list / client.Cache.load({ "id" => ... })
  def Cache(data = nil)
    require_relative 'entity/cache_entity'
    CacheEntity.new(self, data)
  end


  # Canonical facade: client.Character.list / client.Character.load({ "id" => ... })
  def Character(data = nil)
    require_relative 'entity/character_entity'
    CharacterEntity.new(self, data)
  end


  # Canonical facade: client.Chat.list / client.Chat.load({ "id" => ... })
  def Chat(data = nil)
    require_relative 'entity/chat_entity'
    ChatEntity.new(self, data)
  end


  # Canonical facade: client.Cluster.list / client.Cluster.load({ "id" => ... })
  def Cluster(data = nil)
    require_relative 'entity/cluster_entity'
    ClusterEntity.new(self, data)
  end


  # Canonical facade: client.Diff.list / client.Diff.load({ "id" => ... })
  def Diff(data = nil)
    require_relative 'entity/diff_entity'
    DiffEntity.new(self, data)
  end


  # Canonical facade: client.Entity1.list / client.Entity1.load({ "id" => ... })
  def Entity1(data = nil)
    require_relative 'entity/entity1_entity'
    Entity1Entity.new(self, data)
  end


  # Canonical facade: client.GmsNew.list / client.GmsNew.load({ "id" => ... })
  def GmsNew(data = nil)
    require_relative 'entity/gms_new_entity'
    GmsNewEntity.new(self, data)
  end


  # Canonical facade: client.GuildMark.list / client.GuildMark.load({ "id" => ... })
  def GuildMark(data = nil)
    require_relative 'entity/guild_mark_entity'
    GuildMarkEntity.new(self, data)
  end


  # Canonical facade: client.Health.list / client.Health.load({ "id" => ... })
  def Health(data = nil)
    require_relative 'entity/health_entity'
    HealthEntity.new(self, data)
  end


  # Canonical facade: client.Item.list / client.Item.load({ "id" => ... })
  def Item(data = nil)
    require_relative 'entity/item_entity'
    ItemEntity.new(self, data)
  end


  # Canonical facade: client.Job.list / client.Job.load({ "id" => ... })
  def Job(data = nil)
    require_relative 'entity/job_entity'
    JobEntity.new(self, data)
  end


  # Canonical facade: client.Map.list / client.Map.load({ "id" => ... })
  def Map(data = nil)
    require_relative 'entity/map_entity'
    MapEntity.new(self, data)
  end


  # Canonical facade: client.Metric.list / client.Metric.load({ "id" => ... })
  def Metric(data = nil)
    require_relative 'entity/metric_entity'
    MetricEntity.new(self, data)
  end


  # Canonical facade: client.Mob.list / client.Mob.load({ "id" => ... })
  def Mob(data = nil)
    require_relative 'entity/mob_entity'
    MobEntity.new(self, data)
  end


  # Canonical facade: client.Music.list / client.Music.load({ "id" => ... })
  def Music(data = nil)
    require_relative 'entity/music_entity'
    MusicEntity.new(self, data)
  end


  # Canonical facade: client.Name.list / client.Name.load({ "id" => ... })
  def Name(data = nil)
    require_relative 'entity/name_entity'
    NameEntity.new(self, data)
  end


  # Canonical facade: client.Npc.list / client.Npc.load({ "id" => ... })
  def Npc(data = nil)
    require_relative 'entity/npc_entity'
    NpcEntity.new(self, data)
  end


  # Canonical facade: client.Nxf.list / client.Nxf.load({ "id" => ... })
  def Nxf(data = nil)
    require_relative 'entity/nxf_entity'
    NxfEntity.new(self, data)
  end


  # Canonical facade: client.PerformanceMetric.list / client.PerformanceMetric.load({ "id" => ... })
  def PerformanceMetric(data = nil)
    require_relative 'entity/performance_metric_entity'
    PerformanceMetricEntity.new(self, data)
  end


  # Canonical facade: client.Pet.list / client.Pet.load({ "id" => ... })
  def Pet(data = nil)
    require_relative 'entity/pet_entity'
    PetEntity.new(self, data)
  end


  # Canonical facade: client.Quest.list / client.Quest.load({ "id" => ... })
  def Quest(data = nil)
    require_relative 'entity/quest_entity'
    QuestEntity.new(self, data)
  end


  # Canonical facade: client.System.list / client.System.load({ "id" => ... })
  def System(data = nil)
    require_relative 'entity/system_entity'
    SystemEntity.new(self, data)
  end


  # Canonical facade: client.Tip.list / client.Tip.load({ "id" => ... })
  def Tip(data = nil)
    require_relative 'entity/tip_entity'
    TipEntity.new(self, data)
  end


  # Canonical facade: client.Wzn.list / client.Wzn.load({ "id" => ... })
  def Wzn(data = nil)
    require_relative 'entity/wzn_entity'
    WznEntity.new(self, data)
  end


  # Canonical facade: client.Wzn2.list / client.Wzn2.load({ "id" => ... })
  def Wzn2(data = nil)
    require_relative 'entity/wzn2_entity'
    Wzn2Entity.new(self, data)
  end


  # Canonical facade: client.Wzn3.list / client.Wzn3.load({ "id" => ... })
  def Wzn3(data = nil)
    require_relative 'entity/wzn3_entity'
    Wzn3Entity.new(self, data)
  end


  # Canonical facade: client.Wzn4.list / client.Wzn4.load({ "id" => ... })
  def Wzn4(data = nil)
    require_relative 'entity/wzn4_entity'
    Wzn4Entity.new(self, data)
  end


  # Canonical facade: client.Wzn5.list / client.Wzn5.load({ "id" => ... })
  def Wzn5(data = nil)
    require_relative 'entity/wzn5_entity'
    Wzn5Entity.new(self, data)
  end


  # Canonical facade: client.Wzn6.list / client.Wzn6.load({ "id" => ... })
  def Wzn6(data = nil)
    require_relative 'entity/wzn6_entity'
    Wzn6Entity.new(self, data)
  end


  # Canonical facade: client.ZMap.list / client.ZMap.load({ "id" => ... })
  def ZMap(data = nil)
    require_relative 'entity/z_map_entity'
    ZMapEntity.new(self, data)
  end



  def self.test(testopts = nil, sdkopts = nil)
    sdkopts = sdkopts || {}
    sdkopts = VoxgigStruct.clone(sdkopts)
    sdkopts = {} unless sdkopts.is_a?(Hash)

    testopts = testopts || {}
    testopts = VoxgigStruct.clone(testopts)
    testopts = {} unless testopts.is_a?(Hash)
    testopts["active"] = true

    VoxgigStruct.setpath(sdkopts, "feature.test", testopts)

    sdk = MaplestorySDK.new(sdkopts)
    sdk.mode = "test"
    sdk
  end
end
