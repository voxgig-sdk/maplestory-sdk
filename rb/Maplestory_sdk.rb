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


  # Idiomatic facade: client.android.list / client.android.load({ "id" => ... })
  def android
    require_relative 'entity/android_entity'
    @android ||= AndroidEntity.new(self, nil)
  end

  # Deprecated: use client.android instead.
  def Android(data = nil)
    require_relative 'entity/android_entity'
    AndroidEntity.new(self, data)
  end


  # Idiomatic facade: client.avatar.list / client.avatar.load({ "id" => ... })
  def avatar
    require_relative 'entity/avatar_entity'
    @avatar ||= AvatarEntity.new(self, nil)
  end

  # Deprecated: use client.avatar instead.
  def Avatar(data = nil)
    require_relative 'entity/avatar_entity'
    AvatarEntity.new(self, data)
  end


  # Idiomatic facade: client.cache.list / client.cache.load({ "id" => ... })
  def cache
    require_relative 'entity/cache_entity'
    @cache ||= CacheEntity.new(self, nil)
  end

  # Deprecated: use client.cache instead.
  def Cache(data = nil)
    require_relative 'entity/cache_entity'
    CacheEntity.new(self, data)
  end


  # Idiomatic facade: client.character.list / client.character.load({ "id" => ... })
  def character
    require_relative 'entity/character_entity'
    @character ||= CharacterEntity.new(self, nil)
  end

  # Deprecated: use client.character instead.
  def Character(data = nil)
    require_relative 'entity/character_entity'
    CharacterEntity.new(self, data)
  end


  # Idiomatic facade: client.chat.list / client.chat.load({ "id" => ... })
  def chat
    require_relative 'entity/chat_entity'
    @chat ||= ChatEntity.new(self, nil)
  end

  # Deprecated: use client.chat instead.
  def Chat(data = nil)
    require_relative 'entity/chat_entity'
    ChatEntity.new(self, data)
  end


  # Idiomatic facade: client.cluster.list / client.cluster.load({ "id" => ... })
  def cluster
    require_relative 'entity/cluster_entity'
    @cluster ||= ClusterEntity.new(self, nil)
  end

  # Deprecated: use client.cluster instead.
  def Cluster(data = nil)
    require_relative 'entity/cluster_entity'
    ClusterEntity.new(self, data)
  end


  # Idiomatic facade: client.diff.list / client.diff.load({ "id" => ... })
  def diff
    require_relative 'entity/diff_entity'
    @diff ||= DiffEntity.new(self, nil)
  end

  # Deprecated: use client.diff instead.
  def Diff(data = nil)
    require_relative 'entity/diff_entity'
    DiffEntity.new(self, data)
  end


  # Idiomatic facade: client.entity1.list / client.entity1.load({ "id" => ... })
  def entity1
    require_relative 'entity/entity1_entity'
    @entity1 ||= Entity1Entity.new(self, nil)
  end

  # Deprecated: use client.entity1 instead.
  def Entity1(data = nil)
    require_relative 'entity/entity1_entity'
    Entity1Entity.new(self, data)
  end


  # Idiomatic facade: client.gms_new.list / client.gms_new.load({ "id" => ... })
  def gms_new
    require_relative 'entity/gms_new_entity'
    @gms_new ||= GmsNewEntity.new(self, nil)
  end

  # Deprecated: use client.gms_new instead.
  def GmsNew(data = nil)
    require_relative 'entity/gms_new_entity'
    GmsNewEntity.new(self, data)
  end


  # Idiomatic facade: client.guild_mark.list / client.guild_mark.load({ "id" => ... })
  def guild_mark
    require_relative 'entity/guild_mark_entity'
    @guild_mark ||= GuildMarkEntity.new(self, nil)
  end

  # Deprecated: use client.guild_mark instead.
  def GuildMark(data = nil)
    require_relative 'entity/guild_mark_entity'
    GuildMarkEntity.new(self, data)
  end


  # Idiomatic facade: client.health.list / client.health.load({ "id" => ... })
  def health
    require_relative 'entity/health_entity'
    @health ||= HealthEntity.new(self, nil)
  end

  # Deprecated: use client.health instead.
  def Health(data = nil)
    require_relative 'entity/health_entity'
    HealthEntity.new(self, data)
  end


  # Idiomatic facade: client.item.list / client.item.load({ "id" => ... })
  def item
    require_relative 'entity/item_entity'
    @item ||= ItemEntity.new(self, nil)
  end

  # Deprecated: use client.item instead.
  def Item(data = nil)
    require_relative 'entity/item_entity'
    ItemEntity.new(self, data)
  end


  # Idiomatic facade: client.job.list / client.job.load({ "id" => ... })
  def job
    require_relative 'entity/job_entity'
    @job ||= JobEntity.new(self, nil)
  end

  # Deprecated: use client.job instead.
  def Job(data = nil)
    require_relative 'entity/job_entity'
    JobEntity.new(self, data)
  end


  # Idiomatic facade: client.map.list / client.map.load({ "id" => ... })
  def map
    require_relative 'entity/map_entity'
    @map ||= MapEntity.new(self, nil)
  end

  # Deprecated: use client.map instead.
  def Map(data = nil)
    require_relative 'entity/map_entity'
    MapEntity.new(self, data)
  end


  # Idiomatic facade: client.metric.list / client.metric.load({ "id" => ... })
  def metric
    require_relative 'entity/metric_entity'
    @metric ||= MetricEntity.new(self, nil)
  end

  # Deprecated: use client.metric instead.
  def Metric(data = nil)
    require_relative 'entity/metric_entity'
    MetricEntity.new(self, data)
  end


  # Idiomatic facade: client.mob.list / client.mob.load({ "id" => ... })
  def mob
    require_relative 'entity/mob_entity'
    @mob ||= MobEntity.new(self, nil)
  end

  # Deprecated: use client.mob instead.
  def Mob(data = nil)
    require_relative 'entity/mob_entity'
    MobEntity.new(self, data)
  end


  # Idiomatic facade: client.music.list / client.music.load({ "id" => ... })
  def music
    require_relative 'entity/music_entity'
    @music ||= MusicEntity.new(self, nil)
  end

  # Deprecated: use client.music instead.
  def Music(data = nil)
    require_relative 'entity/music_entity'
    MusicEntity.new(self, data)
  end


  # Idiomatic facade: client.name.list / client.name.load({ "id" => ... })
  def name
    require_relative 'entity/name_entity'
    @name ||= NameEntity.new(self, nil)
  end

  # Deprecated: use client.name instead.
  def Name(data = nil)
    require_relative 'entity/name_entity'
    NameEntity.new(self, data)
  end


  # Idiomatic facade: client.npc.list / client.npc.load({ "id" => ... })
  def npc
    require_relative 'entity/npc_entity'
    @npc ||= NpcEntity.new(self, nil)
  end

  # Deprecated: use client.npc instead.
  def Npc(data = nil)
    require_relative 'entity/npc_entity'
    NpcEntity.new(self, data)
  end


  # Idiomatic facade: client.nxf.list / client.nxf.load({ "id" => ... })
  def nxf
    require_relative 'entity/nxf_entity'
    @nxf ||= NxfEntity.new(self, nil)
  end

  # Deprecated: use client.nxf instead.
  def Nxf(data = nil)
    require_relative 'entity/nxf_entity'
    NxfEntity.new(self, data)
  end


  # Idiomatic facade: client.performance_metric.list / client.performance_metric.load({ "id" => ... })
  def performance_metric
    require_relative 'entity/performance_metric_entity'
    @performance_metric ||= PerformanceMetricEntity.new(self, nil)
  end

  # Deprecated: use client.performance_metric instead.
  def PerformanceMetric(data = nil)
    require_relative 'entity/performance_metric_entity'
    PerformanceMetricEntity.new(self, data)
  end


  # Idiomatic facade: client.pet.list / client.pet.load({ "id" => ... })
  def pet
    require_relative 'entity/pet_entity'
    @pet ||= PetEntity.new(self, nil)
  end

  # Deprecated: use client.pet instead.
  def Pet(data = nil)
    require_relative 'entity/pet_entity'
    PetEntity.new(self, data)
  end


  # Idiomatic facade: client.quest.list / client.quest.load({ "id" => ... })
  def quest
    require_relative 'entity/quest_entity'
    @quest ||= QuestEntity.new(self, nil)
  end

  # Deprecated: use client.quest instead.
  def Quest(data = nil)
    require_relative 'entity/quest_entity'
    QuestEntity.new(self, data)
  end


  # Idiomatic facade: client.system.list / client.system.load({ "id" => ... })
  def system
    require_relative 'entity/system_entity'
    @system ||= SystemEntity.new(self, nil)
  end

  # Deprecated: use client.system instead.
  def System(data = nil)
    require_relative 'entity/system_entity'
    SystemEntity.new(self, data)
  end


  # Idiomatic facade: client.tip.list / client.tip.load({ "id" => ... })
  def tip
    require_relative 'entity/tip_entity'
    @tip ||= TipEntity.new(self, nil)
  end

  # Deprecated: use client.tip instead.
  def Tip(data = nil)
    require_relative 'entity/tip_entity'
    TipEntity.new(self, data)
  end


  # Idiomatic facade: client.wzn.list / client.wzn.load({ "id" => ... })
  def wzn
    require_relative 'entity/wzn_entity'
    @wzn ||= WznEntity.new(self, nil)
  end

  # Deprecated: use client.wzn instead.
  def Wzn(data = nil)
    require_relative 'entity/wzn_entity'
    WznEntity.new(self, data)
  end


  # Idiomatic facade: client.wzn2.list / client.wzn2.load({ "id" => ... })
  def wzn2
    require_relative 'entity/wzn2_entity'
    @wzn2 ||= Wzn2Entity.new(self, nil)
  end

  # Deprecated: use client.wzn2 instead.
  def Wzn2(data = nil)
    require_relative 'entity/wzn2_entity'
    Wzn2Entity.new(self, data)
  end


  # Idiomatic facade: client.wzn3.list / client.wzn3.load({ "id" => ... })
  def wzn3
    require_relative 'entity/wzn3_entity'
    @wzn3 ||= Wzn3Entity.new(self, nil)
  end

  # Deprecated: use client.wzn3 instead.
  def Wzn3(data = nil)
    require_relative 'entity/wzn3_entity'
    Wzn3Entity.new(self, data)
  end


  # Idiomatic facade: client.wzn4.list / client.wzn4.load({ "id" => ... })
  def wzn4
    require_relative 'entity/wzn4_entity'
    @wzn4 ||= Wzn4Entity.new(self, nil)
  end

  # Deprecated: use client.wzn4 instead.
  def Wzn4(data = nil)
    require_relative 'entity/wzn4_entity'
    Wzn4Entity.new(self, data)
  end


  # Idiomatic facade: client.wzn5.list / client.wzn5.load({ "id" => ... })
  def wzn5
    require_relative 'entity/wzn5_entity'
    @wzn5 ||= Wzn5Entity.new(self, nil)
  end

  # Deprecated: use client.wzn5 instead.
  def Wzn5(data = nil)
    require_relative 'entity/wzn5_entity'
    Wzn5Entity.new(self, data)
  end


  # Idiomatic facade: client.wzn6.list / client.wzn6.load({ "id" => ... })
  def wzn6
    require_relative 'entity/wzn6_entity'
    @wzn6 ||= Wzn6Entity.new(self, nil)
  end

  # Deprecated: use client.wzn6 instead.
  def Wzn6(data = nil)
    require_relative 'entity/wzn6_entity'
    Wzn6Entity.new(self, data)
  end


  # Idiomatic facade: client.z_map.list / client.z_map.load({ "id" => ... })
  def z_map
    require_relative 'entity/z_map_entity'
    @z_map ||= ZMapEntity.new(self, nil)
  end

  # Deprecated: use client.z_map instead.
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
