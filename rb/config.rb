# Maplestory SDK configuration

module MaplestoryConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Maplestory",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://maplestory.io",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "android" => {},
          "avatar" => {},
          "cache" => {},
          "character" => {},
          "chat" => {},
          "cluster" => {},
          "diff" => {},
          "entity1" => {},
          "gms_new" => {},
          "guild_mark" => {},
          "health" => {},
          "item" => {},
          "job" => {},
          "map" => {},
          "metric" => {},
          "mob" => {},
          "music" => {},
          "name" => {},
          "npc" => {},
          "nxf" => {},
          "performance_metric" => {},
          "pet" => {},
          "quest" => {},
          "system" => {},
          "tip" => {},
          "wzn" => {},
          "z_map" => {},
        },
      },
      "entity" => {
        "android" => {
          "fields" => [],
          "name" => "android",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "android_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/android/{androidId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "android",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "androidId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/android",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "android",
                  ],
                  "select" => {
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
            ],
          },
        },
        "avatar" => {
          "fields" => [],
          "name" => "avatar",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "character_id",
                        "orig" => "item",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "bg_color",
                        "orig" => "bg_color",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "render_mode",
                        "orig" => "render_mode",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/character/{items}/{animation}/animated",
                  "parts" => [
                    "api",
                    "character",
                    "{character_id}",
                    "{animation}",
                    "animated",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "character_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "bg_color",
                      "character_id",
                      "flip_x",
                      "frame",
                      "name",
                      "padding",
                      "render_mode",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "character_id",
                        "orig" => "item",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "format",
                        "orig" => "format",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "render_mode",
                        "orig" => "render_mode",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/character/{items}/{animation}/{frame}/download",
                  "parts" => [
                    "api",
                    "character",
                    "{character_id}",
                    "{animation}",
                    "{frame}",
                    "download",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "character_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "character_id",
                      "flip_x",
                      "format",
                      "frame",
                      "name",
                      "padding",
                      "render_mode",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "item",
                        "orig" => "item",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "format",
                        "orig" => "format",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "render_mode",
                        "orig" => "render_mode",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/character/{items}/download",
                  "parts" => [
                    "api",
                    "character",
                    "{item}",
                    "download",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "flip_x",
                      "format",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "render_mode",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "item",
                        "orig" => "item",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "render_mode",
                        "orig" => "render_mode",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/character/{items}/actions",
                  "parts" => [
                    "api",
                    "character",
                    "{item}",
                    "actions",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "flip_x",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "render_mode",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "item",
                        "orig" => "item",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "render_mode",
                        "orig" => "render_mode",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/character/{items}/{animation}/{frame}",
                  "parts" => [
                    "api",
                    "character",
                    "{item}",
                    "{animation}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "flip_x",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "render_mode",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "character",
              ],
            ],
          },
        },
        "cache" => {
          "fields" => [
            {
              "name" => "evictionCount",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "hitCount",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "hitRatio",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "memoryUsage",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "missCount",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "totalEntries",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "cache",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/metrics/cache",
                  "parts" => [
                    "api",
                    "metrics",
                    "cache",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "character" => {
          "fields" => [],
          "name" => "character",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skin_id",
                        "orig" => "skin_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "animation",
                        "orig" => "animation",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "bg_color",
                        "orig" => "bg_color",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "item",
                        "orig" => "item",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "render_mode",
                        "orig" => "render_mode",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character/animated/{skinId}/{items}/{animation}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "animated",
                    "{skin_id}",
                    "{item}",
                    "{animation}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "bg_color",
                      "flip_x",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "region",
                      "render_mode",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "skin_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skin_id",
                        "orig" => "skin_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "animation",
                        "orig" => "animation",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "frame",
                        "orig" => "frame",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "1102039",
                        "kind" => "query",
                        "name" => "item",
                        "orig" => "item",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "render_mode",
                        "orig" => "render_mode",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character/{skinId}/{items}/{animation}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "{skin_id}",
                    "{item}",
                    "{animation}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "flip_x",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "region",
                      "render_mode",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "skin_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skin_id",
                        "orig" => "skin_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "animation",
                        "orig" => "animation",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "frame",
                        "orig" => "frame",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "1102039",
                        "kind" => "query",
                        "name" => "item",
                        "orig" => "item",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character/center/{skinId}/{items}/{animation}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "center",
                    "{skin_id}",
                    "{item}",
                    "{animation}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "flip_x",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "region",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "skin_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skin_id",
                        "orig" => "skin_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "animation",
                        "orig" => "animation",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "frame",
                        "orig" => "frame",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "1102039",
                        "kind" => "query",
                        "name" => "item",
                        "orig" => "item",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "example" => false,
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character/compact/{skinId}/{items}/{animation}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "compact",
                    "{skin_id}",
                    "{item}",
                    "{animation}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "flip_x",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "region",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "skin_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skin_id",
                        "orig" => "skin_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "animation",
                        "orig" => "animation",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "frame",
                        "orig" => "frame",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "1102039",
                        "kind" => "query",
                        "name" => "item",
                        "orig" => "item",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character/feetCenter/{skinId}/{items}/{animation}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "feetCenter",
                    "{skin_id}",
                    "{item}",
                    "{animation}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "flip_x",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "region",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "skin_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skin_id",
                        "orig" => "skin_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "animation",
                        "orig" => "animation",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "frame",
                        "orig" => "frame",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "1102039",
                        "kind" => "query",
                        "name" => "item",
                        "orig" => "item",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character/navelCenter/{skinId}/{items}/{animation}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "navelCenter",
                    "{skin_id}",
                    "{item}",
                    "{animation}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "flip_x",
                      "frame",
                      "item",
                      "name",
                      "padding",
                      "region",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "skin_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skin_id",
                        "orig" => "skin_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "format",
                        "orig" => "format",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "1102039",
                        "kind" => "query",
                        "name" => "item",
                        "orig" => "item",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 2,
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "render_mode",
                        "orig" => "render_mode",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "example" => false,
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => false,
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => false,
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character/download/{skinId}/{items}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "download",
                    "{skin_id}",
                    "{item}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "flip_x",
                      "format",
                      "item",
                      "name",
                      "padding",
                      "region",
                      "render_mode",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "skin_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => "1102039",
                        "kind" => "query",
                        "name" => "item",
                        "orig" => "item",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character/actions/{items}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "actions",
                    "{item}",
                  ],
                  "rename" => {
                    "param" => {
                      "items" => "item",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "flip_x",
                      "item",
                      "name",
                      "padding",
                      "region",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "flip_x",
                        "orig" => "flip_x",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "padding",
                        "orig" => "padding",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "resize",
                        "orig" => "resize",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_ear",
                        "orig" => "show_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_high_lef_ear",
                        "orig" => "show_high_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "show_lef_ear",
                        "orig" => "show_lef_ear",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/Character",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                  ],
                  "select" => {
                    "exist" => [
                      "flip_x",
                      "name",
                      "padding",
                      "region",
                      "resize",
                      "show_ear",
                      "show_high_lef_ear",
                      "show_lef_ear",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
              [
                "api",
                "action",
              ],
              [
                "api",
                "animated",
              ],
              [
                "api",
                "center",
              ],
              [
                "api",
                "compact",
              ],
              [
                "api",
                "download",
              ],
              [
                "api",
                "feet_center",
              ],
              [
                "api",
                "navel_center",
              ],
              [
                "api",
                "character",
              ],
            ],
          },
        },
        "chat" => {
          "fields" => [],
          "name" => "chat",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "message",
                        "orig" => "message",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "ring_ids_joined",
                        "orig" => "ring_ids_joined",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/chat",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "chat",
                  ],
                  "select" => {
                    "exist" => [
                      "message",
                      "region",
                      "ring_ids_joined",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
            ],
          },
        },
        "cluster" => {
          "fields" => [
            {
              "name" => "hostname",
              "type" => "`$STRING`",
            },
            {
              "name" => "lastSeen",
              "type" => "`$STRING`",
            },
            {
              "name" => "metrics",
              "type" => "`$OBJECT`",
            },
          ],
          "name" => "cluster",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/metrics/cluster",
                  "parts" => [
                    "api",
                    "metrics",
                    "cluster",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.cluster`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "diff" => {
          "fields" => [],
          "name" => "diff",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/diff",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "diff",
                  ],
                  "select" => {
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/diff/grouped",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "diff",
                    "grouped",
                  ],
                  "select" => {
                    "$action" => "grouped",
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
            ],
          },
        },
        "entity1" => {
          "fields" => [],
          "name" => "entity1",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/",
                  "parts" => [],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "gms_new" => {
          "fields" => [],
          "name" => "gms_new",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/gms/latest/news/article/{id}",
                  "parts" => [
                    "api",
                    "gms",
                    "latest",
                    "news",
                    "article",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => "all",
                        "kind" => "query",
                        "name" => "type",
                        "orig" => "type",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/gms/latest/news/{type}",
                  "parts" => [
                    "api",
                    "gms",
                    "latest",
                    "news",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "type" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "type",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "guild_mark" => {
          "fields" => [],
          "name" => "guild_mark",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "guild_background_color_id",
                        "orig" => "guild_background_color_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "guild_background_id",
                        "orig" => "guild_background_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "guild_mark_color_id",
                        "orig" => "guild_mark_color_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "guild_mark_id",
                        "orig" => "guild_mark_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/GuildMark/background/{guildBackgroundId}/{guildBackgroundColorId}/mark/{guildMarkId}/{guildMarkColorId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "GuildMark",
                    "background",
                    "{guild_background_id}",
                    "{guild_background_color_id}",
                    "mark",
                    "{guild_mark_id}",
                    "{guild_mark_color_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "guildBackgroundColorId" => "guild_background_color_id",
                      "guildBackgroundId" => "guild_background_id",
                      "guildMarkColorId" => "guild_mark_color_id",
                      "guildMarkId" => "guild_mark_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "guild_background_color_id",
                      "guild_background_id",
                      "guild_mark_color_id",
                      "guild_mark_id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "color_id",
                        "orig" => "color_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "guild_mark_id",
                        "orig" => "guild_mark_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/GuildMark/{guildMarkId}/{colorId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "GuildMark",
                    "{guild_mark_id}",
                    "{color_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "colorId" => "color_id",
                      "guildMarkId" => "guild_mark_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "color_id",
                      "guild_mark_id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
                "guild_mark",
              ],
              [
                "api",
                "background",
                "mark",
              ],
            ],
          },
        },
        "health" => {
          "fields" => [],
          "name" => "health",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/health/alive",
                  "parts" => [
                    "api",
                    "health",
                    "alive",
                  ],
                  "select" => {
                    "$action" => "alive",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/health/ready",
                  "parts" => [
                    "api",
                    "health",
                    "ready",
                  ],
                  "select" => {
                    "$action" => "ready",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/health/start",
                  "parts" => [
                    "api",
                    "health",
                    "start",
                  ],
                  "select" => {
                    "$action" => "start",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "item" => {
          "fields" => [],
          "name" => "item",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "cash_filter",
                        "orig" => "cash_filter",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "category_filter",
                        "orig" => "category_filter",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "gender_filter",
                        "orig" => "gender_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "job_filter",
                        "orig" => "job_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "max_level_filter",
                        "orig" => "max_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "min_level_filter",
                        "orig" => "min_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "overall_category_filter",
                        "orig" => "overall_category_filter",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "sub_category_filter",
                        "orig" => "sub_category_filter",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                  ],
                  "select" => {
                    "exist" => [
                      "cash_filter",
                      "category_filter",
                      "count",
                      "gender_filter",
                      "job_filter",
                      "max_level_filter",
                      "min_level_filter",
                      "overall_category_filter",
                      "region",
                      "search_for",
                      "start_position",
                      "sub_category_filter",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "cash_filter",
                        "orig" => "cash_filter",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "category_filter",
                        "orig" => "category_filter",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "gender_filter",
                        "orig" => "gender_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "job_filter",
                        "orig" => "job_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "max_level_filter",
                        "orig" => "max_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "min_level_filter",
                        "orig" => "min_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "overall_category_filter",
                        "orig" => "overall_category_filter",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "sub_category_filter",
                        "orig" => "sub_category_filter",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item/count",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "count",
                  ],
                  "select" => {
                    "$action" => "count",
                    "exist" => [
                      "cash_filter",
                      "category_filter",
                      "count",
                      "gender_filter",
                      "job_filter",
                      "max_level_filter",
                      "min_level_filter",
                      "overall_category_filter",
                      "region",
                      "search_for",
                      "start_position",
                      "sub_category_filter",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "cash_filter",
                        "orig" => "cash_filter",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "category_filter",
                        "orig" => "category_filter",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "gender_filter",
                        "orig" => "gender_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "job_filter",
                        "orig" => "job_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "max_level_filter",
                        "orig" => "max_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "min_level_filter",
                        "orig" => "min_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "overall_category_filter",
                        "orig" => "overall_category_filter",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "sub_category_filter",
                        "orig" => "sub_category_filter",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item/list",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "list",
                  ],
                  "select" => {
                    "$action" => "list",
                    "exist" => [
                      "cash_filter",
                      "category_filter",
                      "count",
                      "gender_filter",
                      "job_filter",
                      "max_level_filter",
                      "min_level_filter",
                      "overall_category_filter",
                      "region",
                      "search_for",
                      "start_position",
                      "sub_category_filter",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "item_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item/{itemId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "itemId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "item_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item/{itemId}/icon",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "{id}",
                    "icon",
                  ],
                  "rename" => {
                    "param" => {
                      "itemId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "icon",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "item_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item/{itemId}/iconRaw",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "{id}",
                    "iconRaw",
                  ],
                  "rename" => {
                    "param" => {
                      "itemId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "icon_raw",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "item_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item/{itemId}/name",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "{id}",
                    "name",
                  ],
                  "rename" => {
                    "param" => {
                      "itemId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "name",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "overall_category",
                        "orig" => "overall_category",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item/category/{overallCategory}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "category",
                    "{overall_category}",
                  ],
                  "rename" => {
                    "param" => {
                      "overallCategory" => "overall_category",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "overall_category",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/item/category",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "category",
                  ],
                  "select" => {
                    "$action" => "category",
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
              [
                "api",
                "category",
              ],
            ],
          },
        },
        "job" => {
          "fields" => [],
          "name" => "job",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "job_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skill_id",
                        "orig" => "skill_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/job/{jobId}/skillbook/{skillId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "{id}",
                    "skillbook",
                    "{skill_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "jobId" => "id",
                      "skillId" => "skill_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "skill_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "job_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/job/{jobId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "jobId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "job_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/job/{jobId}/skillbook",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "{id}",
                    "skillbook",
                  ],
                  "rename" => {
                    "param" => {
                      "jobId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "skillbook",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "skill_id",
                        "orig" => "skill_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/job/skill/{skillId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "skill",
                    "{skill_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "skillId" => "skill_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "region",
                      "skill_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/job",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                  ],
                  "select" => {
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/job/count",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "count",
                  ],
                  "select" => {
                    "$action" => "count",
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/job/skilltree",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "skilltree",
                  ],
                  "select" => {
                    "$action" => "skilltree",
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
              [
                "api",
                "skill",
              ],
              [
                "api",
                "skillbook",
              ],
            ],
          },
        },
        "map" => {
          "fields" => [],
          "name" => "map",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => 0,
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "layer",
                        "orig" => "layer",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "map_id",
                        "orig" => "map_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => false,
                        "kind" => "query",
                        "name" => "filter_trash",
                        "orig" => "filter_trash",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "min_x",
                        "orig" => "min_x",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "min_y",
                        "orig" => "min_y",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/{mapId}/render/layer/{layer}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{map_id}",
                    "render",
                    "layer",
                    "{layer}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "mapId" => "map_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "filter_trash",
                      "frame",
                      "layer",
                      "map_id",
                      "min_x",
                      "min_y",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => 0,
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "map_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => false,
                        "kind" => "query",
                        "name" => "show_life",
                        "orig" => "show_life",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => false,
                        "kind" => "query",
                        "name" => "show_portal",
                        "orig" => "show_portal",
                        "type" => "`$BOOLEAN`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/{mapId}/render/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "render",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "frame",
                      "id",
                      "region",
                      "show_life",
                      "show_portal",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                  ],
                  "select" => {
                    "exist" => [
                      "count",
                      "region",
                      "search_for",
                      "start_position",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/count",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "count",
                  ],
                  "select" => {
                    "$action" => "count",
                    "exist" => [
                      "count",
                      "region",
                      "search_for",
                      "start_position",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "map_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/{mapId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "map_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/{mapId}/bgm",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "bgm",
                  ],
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "bgm",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "map_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/{mapId}/icon",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "icon",
                  ],
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "icon",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "map_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/{mapId}/minimap",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "minimap",
                  ],
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "minimap",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "map_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/{mapId}/name",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "name",
                  ],
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "name",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "map",
                        "orig" => "map",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/worldmap/{map}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "worldmap",
                    "{map}",
                  ],
                  "select" => {
                    "exist" => [
                      "map",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "mark_name",
                        "orig" => "mark_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/icon/{markName}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "icon",
                    "{mark_name}",
                  ],
                  "rename" => {
                    "param" => {
                      "markName" => "mark_name",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "mark_name",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/map/worldmap",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "worldmap",
                  ],
                  "select" => {
                    "$action" => "worldmap",
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
              [
                "api",
                "icon",
              ],
              [
                "api",
                "worldmap",
              ],
              [
                "api",
                "render",
              ],
              [
                "api",
                "map",
                "layer",
              ],
            ],
          },
        },
        "metric" => {
          "fields" => [],
          "name" => "metric",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/metrics/health",
                  "parts" => [
                    "api",
                    "metrics",
                    "health",
                  ],
                  "select" => {
                    "$action" => "health",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "mob" => {
          "fields" => [],
          "name" => "mob",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "max_level_filter",
                        "orig" => "max_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "min_level_filter",
                        "orig" => "min_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                  ],
                  "select" => {
                    "exist" => [
                      "count",
                      "max_level_filter",
                      "min_level_filter",
                      "region",
                      "search_for",
                      "start_position",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "max_level_filter",
                        "orig" => "max_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "min_level_filter",
                        "orig" => "min_level_filter",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/count",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "count",
                  ],
                  "select" => {
                    "$action" => "count",
                    "exist" => [
                      "count",
                      "max_level_filter",
                      "min_level_filter",
                      "region",
                      "search_for",
                      "start_position",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "bg_color",
                        "orig" => "bg_color",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}/render/animated/{animation}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "render",
                    "animated",
                    "{animation}",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "bg_color",
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "move",
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "bg_color",
                        "orig" => "bg_color",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}/render/{animation}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "render",
                    "{animation}",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "bg_color",
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "mob_id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "bg_color",
                        "orig" => "bg_color",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/animated/{mobId}/{animation}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "animated",
                    "{mob_id}",
                    "{animation}",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "mob_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "bg_color",
                      "mob_id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "param",
                        "name" => "frame",
                        "orig" => "frame",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "mob_id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}/render/{animation}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{mob_id}",
                    "render",
                    "{animation}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "mob_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "frame",
                      "mob_id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "sound_name",
                        "orig" => "sound_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}/sound/{soundName}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "sound",
                    "{sound_name}",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                      "soundName" => "sound_name",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "sound_name",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}/download",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "download",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "download",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}/icon",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "icon",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "icon",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}/name",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "name",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "name",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "mob_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/mob/{mobId}/sound",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "sound",
                  ],
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "sound",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
              [
                "api",
                "animated",
              ],
              [
                "api",
                "render",
              ],
              [
                "api",
                "sound",
              ],
              [
                "api",
                "mob",
                "render",
              ],
            ],
          },
        },
        "music" => {
          "fields" => [],
          "name" => "music",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "song_path",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/music/{songPath}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "music",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "songPath" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
            ],
          },
        },
        "name" => {
          "fields" => [],
          "name" => "name",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "ring_ids_joined",
                        "orig" => "ring_ids_joined",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/name",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "name",
                  ],
                  "select" => {
                    "exist" => [
                      "name",
                      "region",
                      "ring_ids_joined",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
            ],
          },
        },
        "npc" => {
          "fields" => [],
          "name" => "npc",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "framebook",
                        "orig" => "framebook",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "npc_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "animation",
                        "orig" => "animation",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "bg_color",
                        "orig" => "bg_color",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/npc/{npcId}/render/animated/{framebook}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                    "render",
                    "animated",
                    "{framebook}",
                  ],
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "bg_color",
                      "framebook",
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "framebook",
                        "orig" => "framebook",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "npc_id",
                        "orig" => "npc_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "bg_color",
                        "orig" => "bg_color",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "frame",
                        "orig" => "frame",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/npc/{npcId}/render/{framebook}/{frame}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{npc_id}",
                    "render",
                    "{framebook}",
                    "{frame}",
                  ],
                  "rename" => {
                    "param" => {
                      "npcId" => "npc_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "bg_color",
                      "frame",
                      "framebook",
                      "npc_id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => 2147483647,
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_at",
                        "orig" => "start_at",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/npc",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                  ],
                  "select" => {
                    "exist" => [
                      "count",
                      "region",
                      "search_for",
                      "start_at",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => 2147483647,
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_at",
                        "orig" => "start_at",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/npc/count",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "count",
                  ],
                  "select" => {
                    "$action" => "count",
                    "exist" => [
                      "count",
                      "region",
                      "search_for",
                      "start_at",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "npc_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/npc/{npcId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "npc_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/npc/{npcId}/download",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                    "download",
                  ],
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "download",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "npc_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/npc/{npcId}/icon",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                    "icon",
                  ],
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "icon",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "npc_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/npc/{npcId}/name",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                    "name",
                  ],
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "name",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
              [
                "api",
                "animated",
              ],
              [
                "api",
                "npc",
                "render",
              ],
            ],
          },
        },
        "nxf" => {
          "fields" => [],
          "name" => "nxf",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/about",
                  "parts" => [
                    "api",
                    "about",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/banners",
                  "parts" => [
                    "api",
                    "banners",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "performance_metric" => {
          "fields" => [
            {
              "name" => "activeRequests",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "averageResponseTimeMs",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "cache",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "errorsByType",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "lastUpdated",
              "type" => "`$STRING`",
            },
            {
              "name" => "memoryUsedBytes",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "redisCache",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "requestsPerSecond",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "startTime",
              "type" => "`$STRING`",
            },
            {
              "name" => "system",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "totalErrors",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "totalRequests",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "wzPropertiesLoaded",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "performance_metric",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/metrics",
                  "parts" => [
                    "api",
                    "metrics",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "pet" => {
          "fields" => [],
          "name" => "pet",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "stand0",
                        "kind" => "param",
                        "name" => "animation",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "pet_id",
                        "orig" => "pet_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "frame",
                        "orig" => "frame",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => -1,
                        "kind" => "query",
                        "name" => "pet_equip",
                        "orig" => "pet_equip",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/pet/{petId}/render/{animation}/{frame}/{petEquip}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{pet_id}",
                    "render",
                    "{animation}",
                    "{frame}",
                    "{pet_equip}",
                  ],
                  "rename" => {
                    "param" => {
                      "petEquip" => "pet_equip",
                      "petId" => "pet_id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "animation",
                      "frame",
                      "pet_equip",
                      "pet_id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "pet_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "stand0",
                        "kind" => "param",
                        "name" => "render_id",
                        "orig" => "animation",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => "",
                        "kind" => "query",
                        "name" => "bg_color",
                        "orig" => "bg_color",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => -1,
                        "kind" => "query",
                        "name" => "pet_equip",
                        "orig" => "pet_equip",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/pet/{petId}/render/{animation}/animated/{petEquip}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                    "render",
                    "{render_id}",
                    "animated",
                    "{pet_equip}",
                  ],
                  "rename" => {
                    "param" => {
                      "animation" => "render_id",
                      "petEquip" => "pet_equip",
                      "petId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "bg_color",
                      "id",
                      "pet_equip",
                      "region",
                      "render_id",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "pet_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/pet/{petId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "petId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "pet_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/pet/{petId}/actions",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                    "actions",
                  ],
                  "rename" => {
                    "param" => {
                      "petId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "action",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "pet_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/pet/{petId}/download",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                    "download",
                  ],
                  "rename" => {
                    "param" => {
                      "petId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "download",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "pet_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/pet/{petId}/name",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                    "name",
                  ],
                  "rename" => {
                    "param" => {
                      "petId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "name",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/pet",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                  ],
                  "select" => {
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/pet/count",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "count",
                  ],
                  "select" => {
                    "$action" => "count",
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
              [
                "api",
                "render",
                "animated",
              ],
              [
                "api",
                "pet",
                "render",
              ],
            ],
          },
        },
        "quest" => {
          "fields" => [],
          "name" => "quest",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/quest",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                  ],
                  "select" => {
                    "exist" => [
                      "count",
                      "region",
                      "search_for",
                      "start_position",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "count",
                        "orig" => "count",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search_for",
                        "orig" => "search_for",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start_position",
                        "orig" => "start_position",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/quest/count",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "count",
                  ],
                  "select" => {
                    "$action" => "count",
                    "exist" => [
                      "count",
                      "region",
                      "search_for",
                      "start_position",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "category",
                        "orig" => "category",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/quest/category/{category}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "category",
                    "{category}",
                  ],
                  "select" => {
                    "exist" => [
                      "category",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "quest_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/quest/{questId}",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "questId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "quest_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/quest/{questId}/icon",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "{id}",
                    "icon",
                  ],
                  "rename" => {
                    "param" => {
                      "questId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "icon",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "quest_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/quest/{questId}/name",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "{id}",
                    "name",
                  ],
                  "rename" => {
                    "param" => {
                      "questId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "name",
                    "exist" => [
                      "id",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/quest/category",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "category",
                  ],
                  "select" => {
                    "$action" => "category",
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
              [
                "api",
                "category",
              ],
            ],
          },
        },
        "system" => {
          "fields" => [
            {
              "name" => "cpuUsagePercent",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "gcGen0Collections",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "gcGen1Collections",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "gcGen2Collections",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "threadCount",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "totalMemoryBytes",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "usedMemoryBytes",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "system",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/metrics/system",
                  "parts" => [
                    "api",
                    "metrics",
                    "system",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "tip" => {
          "fields" => [],
          "name" => "tip",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/tips",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "tips",
                  ],
                  "select" => {
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
            ],
          },
        },
        "wzn" => {
          "fields" => [],
          "name" => "wzn",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "path",
                        "orig" => "path",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => false,
                        "kind" => "query",
                        "name" => "raw_image",
                        "orig" => "raw_image",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "region",
                        "orig" => "region",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/wz/export/{region}/{version}/{path}",
                  "parts" => [
                    "api",
                    "wz",
                    "export",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
                  "select" => {
                    "exist" => [
                      "path",
                      "raw_image",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "path",
                        "orig" => "path",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "region",
                        "orig" => "region",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/wz/audio/{region}/{version}/{path}",
                  "parts" => [
                    "api",
                    "wz",
                    "audio",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
                  "select" => {
                    "exist" => [
                      "path",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "path",
                        "orig" => "path",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "region",
                        "orig" => "region",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/wz/img/{region}/{version}/{path}",
                  "parts" => [
                    "api",
                    "wz",
                    "img",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
                  "select" => {
                    "exist" => [
                      "path",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "path",
                        "orig" => "path",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "region",
                        "orig" => "region",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/wz/lookup/{region}/{version}/{path}",
                  "parts" => [
                    "api",
                    "wz",
                    "lookup",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
                  "select" => {
                    "exist" => [
                      "path",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "path",
                        "orig" => "path",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "region",
                        "orig" => "region",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "version",
                        "orig" => "version",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/wz/{region}/{version}/{path}",
                  "parts" => [
                    "api",
                    "wz",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
                  "select" => {
                    "exist" => [
                      "path",
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/wz",
                  "parts" => [
                    "api",
                    "wz",
                  ],
                  "select" => {
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "audio",
              ],
              [
                "export",
              ],
              [
                "img",
              ],
              [
                "lookup",
              ],
              [
                "wz",
              ],
            ],
          },
        },
        "z_map" => {
          "fields" => [],
          "name" => "z_map",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/zmap",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "zmap",
                  ],
                  "select" => {
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "region",
                        "orig" => "region",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "version",
                        "orig" => "version",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/{region}/{version}/zmap/smap",
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "zmap",
                    "smap",
                  ],
                  "select" => {
                    "exist" => [
                      "region",
                      "version",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "api",
              ],
            ],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    MaplestoryFeatures.make_feature(name)
  end
end
