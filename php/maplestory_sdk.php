<?php
declare(strict_types=1);

// Maplestory SDK

require_once __DIR__ . '/utility/struct/Struct.php';
require_once __DIR__ . '/core/UtilityType.php';
require_once __DIR__ . '/core/Spec.php';
require_once __DIR__ . '/core/Helpers.php';

// Load utility registration
require_once __DIR__ . '/utility/Register.php';

// Load config and features
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/features.php';

use Voxgig\Struct\Struct;

class MaplestorySDK
{
    public string $mode;
    public array $features;
    public ?array $options;

    private $_utility;
    private $_rootctx;

    public function __construct(array $options = [])
    {
        $this->mode = "live";
        $this->features = [];
        $this->options = null;

        $utility = new MaplestoryUtility();
        $this->_utility = $utility;

        $config = MaplestoryConfig::make_config();

        $this->_rootctx = ($utility->make_context)([
            "client" => $this,
            "utility" => $utility,
            "config" => $config,
            "options" => $options ?? [],
            "shared" => [],
        ], null);

        $this->options = ($utility->make_options)($this->_rootctx);

        if (Struct::getpath($this->options, "feature.test.active") === true) {
            $this->mode = "test";
        }

        $this->_rootctx->options = $this->options;

        // Add features from config.
        $feature_opts = MaplestoryHelpers::to_map(Struct::getprop($this->options, "feature"));
        if ($feature_opts) {
            $items = Struct::items($feature_opts);
            if ($items) {
                foreach ($items as $item) {
                    $fname = $item[0];
                    $fopts = MaplestoryHelpers::to_map($item[1]);
                    if ($fopts && isset($fopts["active"]) && $fopts["active"] === true) {
                        ($utility->feature_add)($this->_rootctx, MaplestoryFeatures::make_feature($fname));
                    }
                }
            }
        }

        // Add extension features.
        $extend_val = Struct::getprop($this->options, "extend");
        if (is_array($extend_val)) {
            foreach ($extend_val as $f) {
                if (is_object($f) && method_exists($f, 'get_name')) {
                    ($utility->feature_add)($this->_rootctx, $f);
                }
            }
        }

        // Initialize features.
        foreach ($this->features as $f) {
            ($utility->feature_init)($this->_rootctx, $f);
        }

        ($utility->feature_hook)($this->_rootctx, "PostConstruct");
    }

    public function options_map(): array
    {
        $out = Struct::clone($this->options);
        return is_array($out) ? $out : [];
    }

    public function get_utility()
    {
        return MaplestoryUtility::copy($this->_utility);
    }

    public function get_root_ctx()
    {
        return $this->_rootctx;
    }

    public function prepare(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;
        $fetchargs = $fetchargs ?? [];

        $ctrl = MaplestoryHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "prepare",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $opts = $this->options;
        $path = Struct::getprop($fetchargs, "path") ?? "";
        $path = is_string($path) ? $path : "";
        $method_val = Struct::getprop($fetchargs, "method") ?? "GET";
        $method_val = is_string($method_val) ? $method_val : "GET";
        $params = MaplestoryHelpers::to_map(Struct::getprop($fetchargs, "params")) ?? [];
        $query = MaplestoryHelpers::to_map(Struct::getprop($fetchargs, "query")) ?? [];
        $headers = ($utility->prepare_headers)($ctx);

        $base = Struct::getprop($opts, "base") ?? "";
        $base = is_string($base) ? $base : "";
        $prefix = Struct::getprop($opts, "prefix") ?? "";
        $prefix = is_string($prefix) ? $prefix : "";
        $suffix = Struct::getprop($opts, "suffix") ?? "";
        $suffix = is_string($suffix) ? $suffix : "";

        $ctx->spec = new MaplestorySpec([
            "base" => $base, "prefix" => $prefix, "suffix" => $suffix,
            "path" => $path, "method" => $method_val,
            "params" => $params, "query" => $query, "headers" => $headers,
            "body" => Struct::getprop($fetchargs, "body"),
            "step" => "start",
        ]);

        // Merge user-provided headers.
        $uh = Struct::getprop($fetchargs, "headers");
        if (is_array($uh)) {
            foreach ($uh as $k => $v) {
                $ctx->spec->headers[$k] = $v;
            }
        }

        [$_, $err] = ($utility->prepare_auth)($ctx);
        if ($err) {
            return ($utility->make_error)($ctx, $err);
        }

        [$fetchdef, $fd_err] = ($utility->make_fetch_def)($ctx);
        if ($fd_err) {
            return ($utility->make_error)($ctx, $fd_err);
        }
        return $fetchdef;
    }

    public function direct(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;

        // direct() is the raw-HTTP escape hatch: it never throws, it returns
        // an {ok, err, ...} dict. prepare() now raises on error, so catch it
        // and surface the failure through the dict instead.
        try {
            $fetchdef = $this->prepare($fetchargs);
        } catch (\Throwable $err) {
            return ["ok" => false, "err" => $err];
        }

        $fetchargs = $fetchargs ?? [];
        $ctrl = MaplestoryHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "direct",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $url = $fetchdef["url"] ?? "";
        [$fetched, $fetch_err] = ($utility->fetcher)($ctx, $url, $fetchdef);

        if ($fetch_err) {
            return ["ok" => false, "err" => $fetch_err];
        }

        if ($fetched === null) {
            return [
                "ok" => false,
                "err" => $ctx->make_error("direct_no_response", "response: undefined"),
            ];
        }

        if (is_array($fetched)) {
            $status = MaplestoryHelpers::to_int(Struct::getprop($fetched, "status"));
            $headers = Struct::getprop($fetched, "headers") ?? [];

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing — calling json() on an empty body errors.
            $content_length = is_array($headers) ? ($headers["content-length"] ?? null) : null;
            $no_body = $status === 204 || $status === 304 || (string)$content_length === "0";

            $json_data = null;
            if (!$no_body) {
                $jf = Struct::getprop($fetched, "json");
                if (is_callable($jf)) {
                    try {
                        $json_data = $jf();
                    } catch (\Throwable $e) {
                        // Non-JSON body — leave data null but keep status/ok.
                        $json_data = null;
                    }
                }
            }

            return [
                "ok" => $status >= 200 && $status < 300,
                "status" => $status,
                "headers" => Struct::getprop($fetched, "headers"),
                "data" => $json_data,
            ];
        }

        return [
            "ok" => false,
            "err" => $ctx->make_error("direct_invalid", "invalid response type"),
        ];
    }


    private $_android = null;

    // Canonical facade: $client->Android()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->android()
    // resolves here too.
    public function Android($data = null)
    {
        require_once __DIR__ . '/entity/android_entity.php';
        if ($data === null) {
            if ($this->_android === null) {
                $this->_android = new AndroidEntity($this, null);
            }
            return $this->_android;
        }
        return new AndroidEntity($this, $data);
    }


    private $_avatar = null;

    // Canonical facade: $client->Avatar()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->avatar()
    // resolves here too.
    public function Avatar($data = null)
    {
        require_once __DIR__ . '/entity/avatar_entity.php';
        if ($data === null) {
            if ($this->_avatar === null) {
                $this->_avatar = new AvatarEntity($this, null);
            }
            return $this->_avatar;
        }
        return new AvatarEntity($this, $data);
    }


    private $_cache = null;

    // Canonical facade: $client->Cache()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->cache()
    // resolves here too.
    public function Cache($data = null)
    {
        require_once __DIR__ . '/entity/cache_entity.php';
        if ($data === null) {
            if ($this->_cache === null) {
                $this->_cache = new CacheEntity($this, null);
            }
            return $this->_cache;
        }
        return new CacheEntity($this, $data);
    }


    private $_character = null;

    // Canonical facade: $client->Character()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->character()
    // resolves here too.
    public function Character($data = null)
    {
        require_once __DIR__ . '/entity/character_entity.php';
        if ($data === null) {
            if ($this->_character === null) {
                $this->_character = new CharacterEntity($this, null);
            }
            return $this->_character;
        }
        return new CharacterEntity($this, $data);
    }


    private $_chat = null;

    // Canonical facade: $client->Chat()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->chat()
    // resolves here too.
    public function Chat($data = null)
    {
        require_once __DIR__ . '/entity/chat_entity.php';
        if ($data === null) {
            if ($this->_chat === null) {
                $this->_chat = new ChatEntity($this, null);
            }
            return $this->_chat;
        }
        return new ChatEntity($this, $data);
    }


    private $_cluster = null;

    // Canonical facade: $client->Cluster()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->cluster()
    // resolves here too.
    public function Cluster($data = null)
    {
        require_once __DIR__ . '/entity/cluster_entity.php';
        if ($data === null) {
            if ($this->_cluster === null) {
                $this->_cluster = new ClusterEntity($this, null);
            }
            return $this->_cluster;
        }
        return new ClusterEntity($this, $data);
    }


    private $_diff = null;

    // Canonical facade: $client->Diff()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->diff()
    // resolves here too.
    public function Diff($data = null)
    {
        require_once __DIR__ . '/entity/diff_entity.php';
        if ($data === null) {
            if ($this->_diff === null) {
                $this->_diff = new DiffEntity($this, null);
            }
            return $this->_diff;
        }
        return new DiffEntity($this, $data);
    }


    private $_entity1 = null;

    // Canonical facade: $client->Entity1()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->entity1()
    // resolves here too.
    public function Entity1($data = null)
    {
        require_once __DIR__ . '/entity/entity1_entity.php';
        if ($data === null) {
            if ($this->_entity1 === null) {
                $this->_entity1 = new Entity1Entity($this, null);
            }
            return $this->_entity1;
        }
        return new Entity1Entity($this, $data);
    }


    private $_gms_new = null;

    // Canonical facade: $client->GmsNew()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->gms_new()
    // resolves here too.
    public function GmsNew($data = null)
    {
        require_once __DIR__ . '/entity/gms_new_entity.php';
        if ($data === null) {
            if ($this->_gms_new === null) {
                $this->_gms_new = new GmsNewEntity($this, null);
            }
            return $this->_gms_new;
        }
        return new GmsNewEntity($this, $data);
    }


    private $_guild_mark = null;

    // Canonical facade: $client->GuildMark()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->guild_mark()
    // resolves here too.
    public function GuildMark($data = null)
    {
        require_once __DIR__ . '/entity/guild_mark_entity.php';
        if ($data === null) {
            if ($this->_guild_mark === null) {
                $this->_guild_mark = new GuildMarkEntity($this, null);
            }
            return $this->_guild_mark;
        }
        return new GuildMarkEntity($this, $data);
    }


    private $_health = null;

    // Canonical facade: $client->Health()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->health()
    // resolves here too.
    public function Health($data = null)
    {
        require_once __DIR__ . '/entity/health_entity.php';
        if ($data === null) {
            if ($this->_health === null) {
                $this->_health = new HealthEntity($this, null);
            }
            return $this->_health;
        }
        return new HealthEntity($this, $data);
    }


    private $_item = null;

    // Canonical facade: $client->Item()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->item()
    // resolves here too.
    public function Item($data = null)
    {
        require_once __DIR__ . '/entity/item_entity.php';
        if ($data === null) {
            if ($this->_item === null) {
                $this->_item = new ItemEntity($this, null);
            }
            return $this->_item;
        }
        return new ItemEntity($this, $data);
    }


    private $_job = null;

    // Canonical facade: $client->Job()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->job()
    // resolves here too.
    public function Job($data = null)
    {
        require_once __DIR__ . '/entity/job_entity.php';
        if ($data === null) {
            if ($this->_job === null) {
                $this->_job = new JobEntity($this, null);
            }
            return $this->_job;
        }
        return new JobEntity($this, $data);
    }


    private $_map = null;

    // Canonical facade: $client->Map()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->map()
    // resolves here too.
    public function Map($data = null)
    {
        require_once __DIR__ . '/entity/map_entity.php';
        if ($data === null) {
            if ($this->_map === null) {
                $this->_map = new MapEntity($this, null);
            }
            return $this->_map;
        }
        return new MapEntity($this, $data);
    }


    private $_metric = null;

    // Canonical facade: $client->Metric()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->metric()
    // resolves here too.
    public function Metric($data = null)
    {
        require_once __DIR__ . '/entity/metric_entity.php';
        if ($data === null) {
            if ($this->_metric === null) {
                $this->_metric = new MetricEntity($this, null);
            }
            return $this->_metric;
        }
        return new MetricEntity($this, $data);
    }


    private $_mob = null;

    // Canonical facade: $client->Mob()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->mob()
    // resolves here too.
    public function Mob($data = null)
    {
        require_once __DIR__ . '/entity/mob_entity.php';
        if ($data === null) {
            if ($this->_mob === null) {
                $this->_mob = new MobEntity($this, null);
            }
            return $this->_mob;
        }
        return new MobEntity($this, $data);
    }


    private $_music = null;

    // Canonical facade: $client->Music()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->music()
    // resolves here too.
    public function Music($data = null)
    {
        require_once __DIR__ . '/entity/music_entity.php';
        if ($data === null) {
            if ($this->_music === null) {
                $this->_music = new MusicEntity($this, null);
            }
            return $this->_music;
        }
        return new MusicEntity($this, $data);
    }


    private $_name = null;

    // Canonical facade: $client->Name()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->name()
    // resolves here too.
    public function Name($data = null)
    {
        require_once __DIR__ . '/entity/name_entity.php';
        if ($data === null) {
            if ($this->_name === null) {
                $this->_name = new NameEntity($this, null);
            }
            return $this->_name;
        }
        return new NameEntity($this, $data);
    }


    private $_npc = null;

    // Canonical facade: $client->Npc()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->npc()
    // resolves here too.
    public function Npc($data = null)
    {
        require_once __DIR__ . '/entity/npc_entity.php';
        if ($data === null) {
            if ($this->_npc === null) {
                $this->_npc = new NpcEntity($this, null);
            }
            return $this->_npc;
        }
        return new NpcEntity($this, $data);
    }


    private $_nxf = null;

    // Canonical facade: $client->Nxf()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->nxf()
    // resolves here too.
    public function Nxf($data = null)
    {
        require_once __DIR__ . '/entity/nxf_entity.php';
        if ($data === null) {
            if ($this->_nxf === null) {
                $this->_nxf = new NxfEntity($this, null);
            }
            return $this->_nxf;
        }
        return new NxfEntity($this, $data);
    }


    private $_performance_metric = null;

    // Canonical facade: $client->PerformanceMetric()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->performance_metric()
    // resolves here too.
    public function PerformanceMetric($data = null)
    {
        require_once __DIR__ . '/entity/performance_metric_entity.php';
        if ($data === null) {
            if ($this->_performance_metric === null) {
                $this->_performance_metric = new PerformanceMetricEntity($this, null);
            }
            return $this->_performance_metric;
        }
        return new PerformanceMetricEntity($this, $data);
    }


    private $_pet = null;

    // Canonical facade: $client->Pet()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->pet()
    // resolves here too.
    public function Pet($data = null)
    {
        require_once __DIR__ . '/entity/pet_entity.php';
        if ($data === null) {
            if ($this->_pet === null) {
                $this->_pet = new PetEntity($this, null);
            }
            return $this->_pet;
        }
        return new PetEntity($this, $data);
    }


    private $_quest = null;

    // Canonical facade: $client->Quest()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->quest()
    // resolves here too.
    public function Quest($data = null)
    {
        require_once __DIR__ . '/entity/quest_entity.php';
        if ($data === null) {
            if ($this->_quest === null) {
                $this->_quest = new QuestEntity($this, null);
            }
            return $this->_quest;
        }
        return new QuestEntity($this, $data);
    }


    private $_system = null;

    // Canonical facade: $client->System()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->system()
    // resolves here too.
    public function System($data = null)
    {
        require_once __DIR__ . '/entity/system_entity.php';
        if ($data === null) {
            if ($this->_system === null) {
                $this->_system = new SystemEntity($this, null);
            }
            return $this->_system;
        }
        return new SystemEntity($this, $data);
    }


    private $_tip = null;

    // Canonical facade: $client->Tip()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->tip()
    // resolves here too.
    public function Tip($data = null)
    {
        require_once __DIR__ . '/entity/tip_entity.php';
        if ($data === null) {
            if ($this->_tip === null) {
                $this->_tip = new TipEntity($this, null);
            }
            return $this->_tip;
        }
        return new TipEntity($this, $data);
    }


    private $_wzn = null;

    // Canonical facade: $client->Wzn()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->wzn()
    // resolves here too.
    public function Wzn($data = null)
    {
        require_once __DIR__ . '/entity/wzn_entity.php';
        if ($data === null) {
            if ($this->_wzn === null) {
                $this->_wzn = new WznEntity($this, null);
            }
            return $this->_wzn;
        }
        return new WznEntity($this, $data);
    }


    private $_wzn2 = null;

    // Canonical facade: $client->Wzn2()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->wzn2()
    // resolves here too.
    public function Wzn2($data = null)
    {
        require_once __DIR__ . '/entity/wzn2_entity.php';
        if ($data === null) {
            if ($this->_wzn2 === null) {
                $this->_wzn2 = new Wzn2Entity($this, null);
            }
            return $this->_wzn2;
        }
        return new Wzn2Entity($this, $data);
    }


    private $_wzn3 = null;

    // Canonical facade: $client->Wzn3()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->wzn3()
    // resolves here too.
    public function Wzn3($data = null)
    {
        require_once __DIR__ . '/entity/wzn3_entity.php';
        if ($data === null) {
            if ($this->_wzn3 === null) {
                $this->_wzn3 = new Wzn3Entity($this, null);
            }
            return $this->_wzn3;
        }
        return new Wzn3Entity($this, $data);
    }


    private $_wzn4 = null;

    // Canonical facade: $client->Wzn4()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->wzn4()
    // resolves here too.
    public function Wzn4($data = null)
    {
        require_once __DIR__ . '/entity/wzn4_entity.php';
        if ($data === null) {
            if ($this->_wzn4 === null) {
                $this->_wzn4 = new Wzn4Entity($this, null);
            }
            return $this->_wzn4;
        }
        return new Wzn4Entity($this, $data);
    }


    private $_wzn5 = null;

    // Canonical facade: $client->Wzn5()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->wzn5()
    // resolves here too.
    public function Wzn5($data = null)
    {
        require_once __DIR__ . '/entity/wzn5_entity.php';
        if ($data === null) {
            if ($this->_wzn5 === null) {
                $this->_wzn5 = new Wzn5Entity($this, null);
            }
            return $this->_wzn5;
        }
        return new Wzn5Entity($this, $data);
    }


    private $_wzn6 = null;

    // Canonical facade: $client->Wzn6()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->wzn6()
    // resolves here too.
    public function Wzn6($data = null)
    {
        require_once __DIR__ . '/entity/wzn6_entity.php';
        if ($data === null) {
            if ($this->_wzn6 === null) {
                $this->_wzn6 = new Wzn6Entity($this, null);
            }
            return $this->_wzn6;
        }
        return new Wzn6Entity($this, $data);
    }


    private $_z_map = null;

    // Canonical facade: $client->ZMap()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->z_map()
    // resolves here too.
    public function ZMap($data = null)
    {
        require_once __DIR__ . '/entity/z_map_entity.php';
        if ($data === null) {
            if ($this->_z_map === null) {
                $this->_z_map = new ZMapEntity($this, null);
            }
            return $this->_z_map;
        }
        return new ZMapEntity($this, $data);
    }



    public static function test(?array $testopts = null, ?array $sdkopts = null): self
    {
        $sdkopts = $sdkopts ?? [];
        $sdkopts = Struct::clone($sdkopts);
        $sdkopts = is_array($sdkopts) ? $sdkopts : [];

        $testopts = $testopts ?? [];
        $testopts = Struct::clone($testopts);
        $testopts = is_array($testopts) ? $testopts : [];
        $testopts["active"] = true;

        if (!isset($sdkopts["feature"])) {
            $sdkopts["feature"] = [];
        }
        $sdkopts["feature"]["test"] = $testopts;

        $sdk = new MaplestorySDK($sdkopts);
        $sdk->mode = "test";
        return $sdk;
    }
}
