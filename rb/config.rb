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
        "slug" => "maplestory",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
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
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "rename" => {
                    "param" => {
                      "androidId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "android",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "android",
                    "{id}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "android",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "android",
                  ],
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
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
            "parts" => [
              "item",
              "animation",
              "frame",
            ],
            "sep" => "/",
          },
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
                  "rename" => {
                    "param" => {
                      "items" => "character_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "character",
                    },
                    {
                      "var" => "character_id",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "lit" => "animated",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "character",
                    "{character_id}",
                    "{animation}",
                    "animated",
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "character_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "character",
                    },
                    {
                      "var" => "character_id",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                    {
                      "lit" => "download",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "character",
                    "{character_id}",
                    "{animation}",
                    "{frame}",
                    "download",
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "character",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "lit" => "download",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "character",
                    "{item}",
                    "download",
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "character",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "lit" => "actions",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "character",
                    "{item}",
                    "actions",
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "character",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "character",
                    "{item}",
                    "{animation}",
                    "{frame}",
                  ],
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
              "format" => "int64",
              "name" => "evictionCount",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "hitCount",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "double",
              "name" => "hitRatio",
              "type" => "`$NUMBER`",
            },
            {
              "format" => "int64",
              "name" => "memoryUsage",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "missCount",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "metrics",
                    },
                    {
                      "lit" => "cache",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "metrics",
                    "cache",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "character" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
            "parts" => [
              "skin_id",
              "item",
              "animation",
              "frame",
            ],
            "sep" => "/",
          },
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
                    {
                      "lit" => "animated",
                    },
                    {
                      "var" => "skin_id",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
                    {
                      "var" => "skin_id",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
                    {
                      "lit" => "center",
                    },
                    {
                      "var" => "skin_id",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
                    {
                      "lit" => "compact",
                    },
                    {
                      "var" => "skin_id",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
                    {
                      "lit" => "feetCenter",
                    },
                    {
                      "var" => "skin_id",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
                    {
                      "lit" => "navelCenter",
                    },
                    {
                      "var" => "skin_id",
                    },
                    {
                      "var" => "item",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                      "skinId" => "skin_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
                    {
                      "lit" => "download",
                    },
                    {
                      "var" => "skin_id",
                    },
                    {
                      "var" => "item",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "download",
                    "{skin_id}",
                    "{item}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "items" => "item",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
                    {
                      "lit" => "actions",
                    },
                    {
                      "var" => "item",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                    "actions",
                    "{item}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "Character",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "Character",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "chat",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "chat",
                  ],
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
              "format" => "date-time",
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "metrics",
                    },
                    {
                      "lit" => "cluster",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.cluster`",
                  },
                  "parts" => [
                    "api",
                    "metrics",
                    "cluster",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "diff",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "diff",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "diff",
                    },
                    {
                      "lit" => "grouped",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "diff",
                    "grouped",
                  ],
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
                  "segments" => [],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "gms_new" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "gms",
                    },
                    {
                      "lit" => "latest",
                    },
                    {
                      "lit" => "news",
                    },
                    {
                      "lit" => "article",
                    },
                    {
                      "var" => "id",
                    },
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
                  "parts" => [
                    "api",
                    "gms",
                    "latest",
                    "news",
                    "article",
                    "{id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "type" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "gms",
                    },
                    {
                      "lit" => "latest",
                    },
                    {
                      "lit" => "news",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "type",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "gms",
                    "latest",
                    "news",
                    "{id}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "guild_mark" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
            "parts" => [
              "guild_mark_id",
              "color_id",
            ],
            "sep" => "/",
          },
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
                  "rename" => {
                    "param" => {
                      "guildBackgroundColorId" => "guild_background_color_id",
                      "guildBackgroundId" => "guild_background_id",
                      "guildMarkColorId" => "guild_mark_color_id",
                      "guildMarkId" => "guild_mark_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "GuildMark",
                    },
                    {
                      "lit" => "background",
                    },
                    {
                      "var" => "guild_background_id",
                    },
                    {
                      "var" => "guild_background_color_id",
                    },
                    {
                      "lit" => "mark",
                    },
                    {
                      "var" => "guild_mark_id",
                    },
                    {
                      "var" => "guild_mark_color_id",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "colorId" => "color_id",
                      "guildMarkId" => "guild_mark_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "GuildMark",
                    },
                    {
                      "var" => "guild_mark_id",
                    },
                    {
                      "var" => "color_id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "GuildMark",
                    "{guild_mark_id}",
                    "{color_id}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "health",
                    },
                    {
                      "lit" => "alive",
                    },
                  ],
                  "select" => {
                    "$action" => "alive",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "health",
                    "alive",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/health/ready",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "health",
                    },
                    {
                      "lit" => "ready",
                    },
                  ],
                  "select" => {
                    "$action" => "ready",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "health",
                    "ready",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/health/start",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "health",
                    },
                    {
                      "lit" => "start",
                    },
                  ],
                  "select" => {
                    "$action" => "start",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "health",
                    "start",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "item" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
                    {
                      "lit" => "count",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "count",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
                    {
                      "lit" => "list",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "list",
                  ],
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
                  "rename" => {
                    "param" => {
                      "itemId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "{id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "itemId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "icon",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "{id}",
                    "icon",
                  ],
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
                  "rename" => {
                    "param" => {
                      "itemId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "iconRaw",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "{id}",
                    "iconRaw",
                  ],
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
                  "rename" => {
                    "param" => {
                      "itemId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "name",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "{id}",
                    "name",
                  ],
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
                  "rename" => {
                    "param" => {
                      "overallCategory" => "overall_category",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
                    {
                      "lit" => "category",
                    },
                    {
                      "var" => "overall_category",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "category",
                    "{overall_category}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "item",
                    },
                    {
                      "lit" => "category",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "item",
                    "category",
                  ],
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
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "rename" => {
                    "param" => {
                      "jobId" => "id",
                      "skillId" => "skill_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "job",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "skillbook",
                    },
                    {
                      "var" => "skill_id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "{id}",
                    "skillbook",
                    "{skill_id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "jobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "job",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "{id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "jobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "job",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "skillbook",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "{id}",
                    "skillbook",
                  ],
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
                  "rename" => {
                    "param" => {
                      "skillId" => "skill_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "job",
                    },
                    {
                      "lit" => "skill",
                    },
                    {
                      "var" => "skill_id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "skill",
                    "{skill_id}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "job",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "job",
                    },
                    {
                      "lit" => "count",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "count",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "job",
                    },
                    {
                      "lit" => "skilltree",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "job",
                    "skilltree",
                  ],
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
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "rename" => {
                    "param" => {
                      "mapId" => "map_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "var" => "map_id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "lit" => "layer",
                    },
                    {
                      "var" => "layer",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "render",
                    "{frame}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "lit" => "count",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "count",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "bgm",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "bgm",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "icon",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "icon",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "minimap",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "minimap",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mapId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "name",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "{id}",
                    "name",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "lit" => "worldmap",
                    },
                    {
                      "var" => "map",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "worldmap",
                    "{map}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "markName" => "mark_name",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "lit" => "icon",
                    },
                    {
                      "var" => "mark_name",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "icon",
                    "{mark_name}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "map",
                    },
                    {
                      "lit" => "worldmap",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "map",
                    "worldmap",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "metrics",
                    },
                    {
                      "lit" => "health",
                    },
                  ],
                  "select" => {
                    "$action" => "health",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "metrics",
                    "health",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "mob" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "lit" => "count",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "count",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "lit" => "animated",
                    },
                    {
                      "var" => "animation",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "var" => "animation",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "render",
                    "{animation}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "mob_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "lit" => "animated",
                    },
                    {
                      "var" => "mob_id",
                    },
                    {
                      "var" => "animation",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "animated",
                    "{mob_id}",
                    "{animation}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "mob_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "mob_id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                      "soundName" => "sound_name",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "sound",
                    },
                    {
                      "var" => "sound_name",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "sound",
                    "{sound_name}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "download",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "download",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "icon",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "icon",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "name",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "name",
                  ],
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
                  "rename" => {
                    "param" => {
                      "mobId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "mob",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "sound",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "mob",
                    "{id}",
                    "sound",
                  ],
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
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "rename" => {
                    "param" => {
                      "songPath" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "music",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "music",
                    "{id}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "name",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "name",
                  ],
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
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "npc",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "lit" => "animated",
                    },
                    {
                      "var" => "framebook",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "npcId" => "npc_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "npc",
                    },
                    {
                      "var" => "npc_id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "var" => "framebook",
                    },
                    {
                      "var" => "frame",
                    },
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "npc",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "npc",
                    },
                    {
                      "lit" => "count",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "count",
                  ],
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
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "npc",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "npc",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "download",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                    "download",
                  ],
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
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "npc",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "icon",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                    "icon",
                  ],
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
                  "rename" => {
                    "param" => {
                      "npcId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "npc",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "name",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "npc",
                    "{id}",
                    "name",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "about",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "about",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/banners",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "banners",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "banners",
                  ],
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
              "format" => "int64",
              "name" => "activeRequests",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "double",
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
              "format" => "date-time",
              "name" => "lastUpdated",
              "type" => "`$STRING`",
            },
            {
              "format" => "int64",
              "name" => "memoryUsedBytes",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "redisCache",
              "type" => "`$OBJECT`",
            },
            {
              "format" => "double",
              "name" => "requestsPerSecond",
              "type" => "`$NUMBER`",
            },
            {
              "format" => "date-time",
              "name" => "startTime",
              "type" => "`$STRING`",
            },
            {
              "name" => "system",
              "type" => "`$OBJECT`",
            },
            {
              "format" => "int64",
              "name" => "totalErrors",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "totalRequests",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "metrics",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "metrics",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "pet" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "rename" => {
                    "param" => {
                      "petEquip" => "pet_equip",
                      "petId" => "pet_id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "pet",
                    },
                    {
                      "var" => "pet_id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "var" => "animation",
                    },
                    {
                      "var" => "frame",
                    },
                    {
                      "var" => "pet_equip",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "animation" => "render_id",
                      "petEquip" => "pet_equip",
                      "petId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "pet",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "render",
                    },
                    {
                      "var" => "render_id",
                    },
                    {
                      "lit" => "animated",
                    },
                    {
                      "var" => "pet_equip",
                    },
                  ],
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
                  "rename" => {
                    "param" => {
                      "petId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "pet",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "petId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "pet",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "actions",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                    "actions",
                  ],
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
                  "rename" => {
                    "param" => {
                      "petId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "pet",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "download",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                    "download",
                  ],
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
                  "rename" => {
                    "param" => {
                      "petId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "pet",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "name",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "{id}",
                    "name",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "pet",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "pet",
                    },
                    {
                      "lit" => "count",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "pet",
                    "count",
                  ],
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
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "quest",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "quest",
                    },
                    {
                      "lit" => "count",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "count",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "quest",
                    },
                    {
                      "lit" => "category",
                    },
                    {
                      "var" => "category",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "category",
                    "{category}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "questId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "quest",
                    },
                    {
                      "var" => "id",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "{id}",
                  ],
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
                  "rename" => {
                    "param" => {
                      "questId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "quest",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "icon",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "{id}",
                    "icon",
                  ],
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
                  "rename" => {
                    "param" => {
                      "questId" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "quest",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "name",
                    },
                  ],
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "{id}",
                    "name",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "quest",
                    },
                    {
                      "lit" => "category",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "quest",
                    "category",
                  ],
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
              "format" => "double",
              "name" => "cpuUsagePercent",
              "type" => "`$NUMBER`",
            },
            {
              "format" => "int64",
              "name" => "gcGen0Collections",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "gcGen1Collections",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "gcGen2Collections",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int32",
              "name" => "threadCount",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "totalMemoryBytes",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "metrics",
                    },
                    {
                      "lit" => "system",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "metrics",
                    "system",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "tips",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "tips",
                  ],
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
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
            "parts" => [
              "region",
              "version",
              "path",
            ],
            "sep" => "/",
          },
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "wz",
                    },
                    {
                      "lit" => "export",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "var" => "path",
                    },
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
                  "parts" => [
                    "api",
                    "wz",
                    "export",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "wz",
                    },
                    {
                      "lit" => "audio",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "var" => "path",
                    },
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
                  "parts" => [
                    "api",
                    "wz",
                    "audio",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "wz",
                    },
                    {
                      "lit" => "img",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "var" => "path",
                    },
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
                  "parts" => [
                    "api",
                    "wz",
                    "img",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "wz",
                    },
                    {
                      "lit" => "lookup",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "var" => "path",
                    },
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
                  "parts" => [
                    "api",
                    "wz",
                    "lookup",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "wz",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "var" => "path",
                    },
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
                  "parts" => [
                    "api",
                    "wz",
                    "{region}",
                    "{version}",
                    "{path}",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "wz",
                    },
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
                  "parts" => [
                    "api",
                    "wz",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "zmap",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "zmap",
                  ],
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
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "var" => "region",
                    },
                    {
                      "var" => "version",
                    },
                    {
                      "lit" => "zmap",
                    },
                    {
                      "lit" => "smap",
                    },
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
                  "parts" => [
                    "api",
                    "{region}",
                    "{version}",
                    "zmap",
                    "smap",
                  ],
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
