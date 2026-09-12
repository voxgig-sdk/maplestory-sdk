package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Maplestory",
			"slug": "maplestory",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://maplestory.io",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"android": map[string]any{},
				"avatar": map[string]any{},
				"cache": map[string]any{},
				"character": map[string]any{},
				"chat": map[string]any{},
				"cluster": map[string]any{},
				"diff": map[string]any{},
				"entity1": map[string]any{},
				"gms_new": map[string]any{},
				"guild_mark": map[string]any{},
				"health": map[string]any{},
				"item": map[string]any{},
				"job": map[string]any{},
				"map": map[string]any{},
				"metric": map[string]any{},
				"mob": map[string]any{},
				"music": map[string]any{},
				"name": map[string]any{},
				"npc": map[string]any{},
				"nxf": map[string]any{},
				"performance_metric": map[string]any{},
				"pet": map[string]any{},
				"quest": map[string]any{},
				"system": map[string]any{},
				"tip": map[string]any{},
				"wzn": map[string]any{},
				"z_map": map[string]any{},
			},
		},
		"entity": map[string]any{
			"android": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "android",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "android_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/android/{androidId}",
								"rename": map[string]any{
									"param": map[string]any{
										"androidId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "android",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"android",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/android",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "android",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"android",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
					},
				},
			},
			"avatar": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
					"parts": []any{
						"item",
						"animation",
						"frame",
					},
					"sep": "/",
				},
				"name": "avatar",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "character_id",
											"orig": "item",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
									"query": []any{
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "bg_color",
											"orig": "bg_color",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "render_mode",
											"orig": "render_mode",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/character/{items}/{animation}/animated",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "character_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "character",
									},
									map[string]any{
										"var": "character_id",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"lit": "animated",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"character",
									"{character_id}",
									"{animation}",
									"animated",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "character_id",
											"orig": "item",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "format",
											"orig": "format",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "render_mode",
											"orig": "render_mode",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/character/{items}/{animation}/{frame}/download",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "character_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "character",
									},
									map[string]any{
										"var": "character_id",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
									map[string]any{
										"lit": "download",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"character",
									"{character_id}",
									"{animation}",
									"{frame}",
									"download",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "item",
											"orig": "item",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "format",
											"orig": "format",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "render_mode",
											"orig": "render_mode",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/character/{items}/download",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "character",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"lit": "download",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"character",
									"{item}",
									"download",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "item",
											"orig": "item",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "render_mode",
											"orig": "render_mode",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/character/{items}/actions",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "character",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"lit": "actions",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"character",
									"{item}",
									"actions",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "item",
											"orig": "item",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "render_mode",
											"orig": "render_mode",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/character/{items}/{animation}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "character",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"character",
									"{item}",
									"{animation}",
									"{frame}",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"character",
						},
					},
				},
			},
			"cache": map[string]any{
				"fields": []any{
					map[string]any{
						"format": "int64",
						"name": "evictionCount",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "hitCount",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "double",
						"name": "hitRatio",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"format": "int64",
						"name": "memoryUsage",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "missCount",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "totalEntries",
						"type": "`$INTEGER`",
					},
				},
				"name": "cache",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/metrics/cache",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "metrics",
									},
									map[string]any{
										"lit": "cache",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"metrics",
									"cache",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"character": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
					"parts": []any{
						"skin_id",
						"item",
						"animation",
						"frame",
					},
					"sep": "/",
				},
				"name": "character",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skin_id",
											"orig": "skin_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "animation",
											"orig": "animation",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "bg_color",
											"orig": "bg_color",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "item",
											"orig": "item",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "render_mode",
											"orig": "render_mode",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character/animated/{skinId}/{items}/{animation}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
										"skinId": "skin_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
									map[string]any{
										"lit": "animated",
									},
									map[string]any{
										"var": "skin_id",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
									"animated",
									"{skin_id}",
									"{item}",
									"{animation}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skin_id",
											"orig": "skin_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "animation",
											"orig": "animation",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "frame",
											"orig": "frame",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "1102039",
											"kind": "query",
											"name": "item",
											"orig": "item",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "render_mode",
											"orig": "render_mode",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character/{skinId}/{items}/{animation}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
										"skinId": "skin_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
									map[string]any{
										"var": "skin_id",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
									"{skin_id}",
									"{item}",
									"{animation}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skin_id",
											"orig": "skin_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "animation",
											"orig": "animation",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "frame",
											"orig": "frame",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "1102039",
											"kind": "query",
											"name": "item",
											"orig": "item",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character/center/{skinId}/{items}/{animation}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
										"skinId": "skin_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
									map[string]any{
										"lit": "center",
									},
									map[string]any{
										"var": "skin_id",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
									"center",
									"{skin_id}",
									"{item}",
									"{animation}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skin_id",
											"orig": "skin_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "animation",
											"orig": "animation",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "frame",
											"orig": "frame",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "1102039",
											"kind": "query",
											"name": "item",
											"orig": "item",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"example": false,
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character/compact/{skinId}/{items}/{animation}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
										"skinId": "skin_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
									map[string]any{
										"lit": "compact",
									},
									map[string]any{
										"var": "skin_id",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
									"compact",
									"{skin_id}",
									"{item}",
									"{animation}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skin_id",
											"orig": "skin_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "animation",
											"orig": "animation",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "frame",
											"orig": "frame",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "1102039",
											"kind": "query",
											"name": "item",
											"orig": "item",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character/feetCenter/{skinId}/{items}/{animation}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
										"skinId": "skin_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
									map[string]any{
										"lit": "feetCenter",
									},
									map[string]any{
										"var": "skin_id",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
									"feetCenter",
									"{skin_id}",
									"{item}",
									"{animation}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skin_id",
											"orig": "skin_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "animation",
											"orig": "animation",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "frame",
											"orig": "frame",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "1102039",
											"kind": "query",
											"name": "item",
											"orig": "item",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character/navelCenter/{skinId}/{items}/{animation}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
										"skinId": "skin_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
									map[string]any{
										"lit": "navelCenter",
									},
									map[string]any{
										"var": "skin_id",
									},
									map[string]any{
										"var": "item",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
									"navelCenter",
									"{skin_id}",
									"{item}",
									"{animation}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skin_id",
											"orig": "skin_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "format",
											"orig": "format",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "1102039",
											"kind": "query",
											"name": "item",
											"orig": "item",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 2,
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "render_mode",
											"orig": "render_mode",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"example": false,
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": false,
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": false,
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character/download/{skinId}/{items}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
										"skinId": "skin_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
									map[string]any{
										"lit": "download",
									},
									map[string]any{
										"var": "skin_id",
									},
									map[string]any{
										"var": "item",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
									"download",
									"{skin_id}",
									"{item}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": "1102039",
											"kind": "query",
											"name": "item",
											"orig": "item",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character/actions/{items}",
								"rename": map[string]any{
									"param": map[string]any{
										"items": "item",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
									map[string]any{
										"lit": "actions",
									},
									map[string]any{
										"var": "item",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
									"actions",
									"{item}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "flip_x",
											"orig": "flip_x",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "padding",
											"orig": "padding",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "resize",
											"orig": "resize",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_ear",
											"orig": "show_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_high_lef_ear",
											"orig": "show_high_lef_ear",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "show_lef_ear",
											"orig": "show_lef_ear",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/Character",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "Character",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"flip_x",
										"name",
										"padding",
										"region",
										"resize",
										"show_ear",
										"show_high_lef_ear",
										"show_lef_ear",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"Character",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
						[]any{
							"api",
							"action",
						},
						[]any{
							"api",
							"animated",
						},
						[]any{
							"api",
							"center",
						},
						[]any{
							"api",
							"compact",
						},
						[]any{
							"api",
							"download",
						},
						[]any{
							"api",
							"feet_center",
						},
						[]any{
							"api",
							"navel_center",
						},
						[]any{
							"api",
							"character",
						},
					},
				},
			},
			"chat": map[string]any{
				"fields": []any{},
				"name": "chat",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "message",
											"orig": "message",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "ring_ids_joined",
											"orig": "ring_ids_joined",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/chat",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "chat",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"message",
										"region",
										"ring_ids_joined",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"chat",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
					},
				},
			},
			"cluster": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "hostname",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "date-time",
						"name": "lastSeen",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "metrics",
						"type": "`$OBJECT`",
					},
				},
				"name": "cluster",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/metrics/cluster",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "metrics",
									},
									map[string]any{
										"lit": "cluster",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.cluster`",
								},
								"parts": []any{
									"api",
									"metrics",
									"cluster",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"diff": map[string]any{
				"fields": []any{},
				"name": "diff",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/diff",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "diff",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"diff",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/diff/grouped",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "diff",
									},
									map[string]any{
										"lit": "grouped",
									},
								},
								"select": map[string]any{
									"$action": "grouped",
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"diff",
									"grouped",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
					},
				},
			},
			"entity1": map[string]any{
				"fields": []any{},
				"name": "entity1",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/",
								"segments": []any{},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"gms_new": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "gms_new",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/gms/latest/news/article/{id}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "gms",
									},
									map[string]any{
										"lit": "latest",
									},
									map[string]any{
										"lit": "news",
									},
									map[string]any{
										"lit": "article",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"gms",
									"latest",
									"news",
									"article",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "all",
											"kind": "query",
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/gms/latest/news/{type}",
								"rename": map[string]any{
									"param": map[string]any{
										"type": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "gms",
									},
									map[string]any{
										"lit": "latest",
									},
									map[string]any{
										"lit": "news",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"type",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"gms",
									"latest",
									"news",
									"{id}",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"guild_mark": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
					"parts": []any{
						"guild_mark_id",
						"color_id",
					},
					"sep": "/",
				},
				"name": "guild_mark",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "guild_background_color_id",
											"orig": "guild_background_color_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "guild_background_id",
											"orig": "guild_background_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "guild_mark_color_id",
											"orig": "guild_mark_color_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "guild_mark_id",
											"orig": "guild_mark_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/GuildMark/background/{guildBackgroundId}/{guildBackgroundColorId}/mark/{guildMarkId}/{guildMarkColorId}",
								"rename": map[string]any{
									"param": map[string]any{
										"guildBackgroundColorId": "guild_background_color_id",
										"guildBackgroundId": "guild_background_id",
										"guildMarkColorId": "guild_mark_color_id",
										"guildMarkId": "guild_mark_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "GuildMark",
									},
									map[string]any{
										"lit": "background",
									},
									map[string]any{
										"var": "guild_background_id",
									},
									map[string]any{
										"var": "guild_background_color_id",
									},
									map[string]any{
										"lit": "mark",
									},
									map[string]any{
										"var": "guild_mark_id",
									},
									map[string]any{
										"var": "guild_mark_color_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"guild_background_color_id",
										"guild_background_id",
										"guild_mark_color_id",
										"guild_mark_id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
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
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "color_id",
											"orig": "color_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "guild_mark_id",
											"orig": "guild_mark_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/GuildMark/{guildMarkId}/{colorId}",
								"rename": map[string]any{
									"param": map[string]any{
										"colorId": "color_id",
										"guildMarkId": "guild_mark_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "GuildMark",
									},
									map[string]any{
										"var": "guild_mark_id",
									},
									map[string]any{
										"var": "color_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"color_id",
										"guild_mark_id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"GuildMark",
									"{guild_mark_id}",
									"{color_id}",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
							"guild_mark",
						},
						[]any{
							"api",
							"background",
							"mark",
						},
					},
				},
			},
			"health": map[string]any{
				"fields": []any{},
				"name": "health",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/health/alive",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "health",
									},
									map[string]any{
										"lit": "alive",
									},
								},
								"select": map[string]any{
									"$action": "alive",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"health",
									"alive",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/health/ready",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "health",
									},
									map[string]any{
										"lit": "ready",
									},
								},
								"select": map[string]any{
									"$action": "ready",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"health",
									"ready",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/health/start",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "health",
									},
									map[string]any{
										"lit": "start",
									},
								},
								"select": map[string]any{
									"$action": "start",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"health",
									"start",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"item": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "item",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "cash_filter",
											"orig": "cash_filter",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "category_filter",
											"orig": "category_filter",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "gender_filter",
											"orig": "gender_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "job_filter",
											"orig": "job_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "max_level_filter",
											"orig": "max_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "min_level_filter",
											"orig": "min_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "overall_category_filter",
											"orig": "overall_category_filter",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "sub_category_filter",
											"orig": "sub_category_filter",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "cash_filter",
											"orig": "cash_filter",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "category_filter",
											"orig": "category_filter",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "gender_filter",
											"orig": "gender_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "job_filter",
											"orig": "job_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "max_level_filter",
											"orig": "max_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "min_level_filter",
											"orig": "min_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "overall_category_filter",
											"orig": "overall_category_filter",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "sub_category_filter",
											"orig": "sub_category_filter",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item/count",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
									map[string]any{
										"lit": "count",
									},
								},
								"select": map[string]any{
									"$action": "count",
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
									"count",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "cash_filter",
											"orig": "cash_filter",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "category_filter",
											"orig": "category_filter",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "gender_filter",
											"orig": "gender_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "job_filter",
											"orig": "job_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "max_level_filter",
											"orig": "max_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "min_level_filter",
											"orig": "min_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "overall_category_filter",
											"orig": "overall_category_filter",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "sub_category_filter",
											"orig": "sub_category_filter",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item/list",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
									map[string]any{
										"lit": "list",
									},
								},
								"select": map[string]any{
									"$action": "list",
									"exist": []any{
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
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
									"list",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "item_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item/{itemId}",
								"rename": map[string]any{
									"param": map[string]any{
										"itemId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "item_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item/{itemId}/icon",
								"rename": map[string]any{
									"param": map[string]any{
										"itemId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "icon",
									},
								},
								"select": map[string]any{
									"$action": "icon",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
									"{id}",
									"icon",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "item_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item/{itemId}/iconRaw",
								"rename": map[string]any{
									"param": map[string]any{
										"itemId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "iconRaw",
									},
								},
								"select": map[string]any{
									"$action": "icon_raw",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
									"{id}",
									"iconRaw",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "item_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item/{itemId}/name",
								"rename": map[string]any{
									"param": map[string]any{
										"itemId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "name",
									},
								},
								"select": map[string]any{
									"$action": "name",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
									"{id}",
									"name",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "overall_category",
											"orig": "overall_category",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item/category/{overallCategory}",
								"rename": map[string]any{
									"param": map[string]any{
										"overallCategory": "overall_category",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
									map[string]any{
										"lit": "category",
									},
									map[string]any{
										"var": "overall_category",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"overall_category",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
									"category",
									"{overall_category}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/item/category",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "item",
									},
									map[string]any{
										"lit": "category",
									},
								},
								"select": map[string]any{
									"$action": "category",
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"item",
									"category",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
						[]any{
							"api",
							"category",
						},
					},
				},
			},
			"job": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "job",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "job_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skill_id",
											"orig": "skill_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/job/{jobId}/skillbook/{skillId}",
								"rename": map[string]any{
									"param": map[string]any{
										"jobId": "id",
										"skillId": "skill_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "job",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "skillbook",
									},
									map[string]any{
										"var": "skill_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"skill_id",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"job",
									"{id}",
									"skillbook",
									"{skill_id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "job_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/job/{jobId}",
								"rename": map[string]any{
									"param": map[string]any{
										"jobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "job",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"job",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "job_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/job/{jobId}/skillbook",
								"rename": map[string]any{
									"param": map[string]any{
										"jobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "job",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "skillbook",
									},
								},
								"select": map[string]any{
									"$action": "skillbook",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"job",
									"{id}",
									"skillbook",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "skill_id",
											"orig": "skill_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/job/skill/{skillId}",
								"rename": map[string]any{
									"param": map[string]any{
										"skillId": "skill_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "job",
									},
									map[string]any{
										"lit": "skill",
									},
									map[string]any{
										"var": "skill_id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"skill_id",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"job",
									"skill",
									"{skill_id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/job",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "job",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"job",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/job/count",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "job",
									},
									map[string]any{
										"lit": "count",
									},
								},
								"select": map[string]any{
									"$action": "count",
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"job",
									"count",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/job/skilltree",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "job",
									},
									map[string]any{
										"lit": "skilltree",
									},
								},
								"select": map[string]any{
									"$action": "skilltree",
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"job",
									"skilltree",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
						[]any{
							"api",
							"skill",
						},
						[]any{
							"api",
							"skillbook",
						},
					},
				},
			},
			"map": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "map",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": 0,
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "layer",
											"orig": "layer",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "map_id",
											"orig": "map_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": false,
											"kind": "query",
											"name": "filter_trash",
											"orig": "filter_trash",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "min_x",
											"orig": "min_x",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "min_y",
											"orig": "min_y",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/{mapId}/render/layer/{layer}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"mapId": "map_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"var": "map_id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"lit": "layer",
									},
									map[string]any{
										"var": "layer",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"filter_trash",
										"frame",
										"layer",
										"map_id",
										"min_x",
										"min_y",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"{map_id}",
									"render",
									"layer",
									"{layer}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": 0,
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "map_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": false,
											"kind": "query",
											"name": "show_life",
											"orig": "show_life",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": false,
											"kind": "query",
											"name": "show_portal",
											"orig": "show_portal",
											"type": "`$BOOLEAN`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/{mapId}/render/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"mapId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"frame",
										"id",
										"region",
										"show_life",
										"show_portal",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"{id}",
									"render",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"count",
										"region",
										"search_for",
										"start_position",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/count",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"lit": "count",
									},
								},
								"select": map[string]any{
									"$action": "count",
									"exist": []any{
										"count",
										"region",
										"search_for",
										"start_position",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"count",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "map_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/{mapId}",
								"rename": map[string]any{
									"param": map[string]any{
										"mapId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "map_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/{mapId}/bgm",
								"rename": map[string]any{
									"param": map[string]any{
										"mapId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "bgm",
									},
								},
								"select": map[string]any{
									"$action": "bgm",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"{id}",
									"bgm",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "map_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/{mapId}/icon",
								"rename": map[string]any{
									"param": map[string]any{
										"mapId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "icon",
									},
								},
								"select": map[string]any{
									"$action": "icon",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"{id}",
									"icon",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "map_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/{mapId}/minimap",
								"rename": map[string]any{
									"param": map[string]any{
										"mapId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "minimap",
									},
								},
								"select": map[string]any{
									"$action": "minimap",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"{id}",
									"minimap",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "map_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/{mapId}/name",
								"rename": map[string]any{
									"param": map[string]any{
										"mapId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "name",
									},
								},
								"select": map[string]any{
									"$action": "name",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"{id}",
									"name",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "map",
											"orig": "map",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/worldmap/{map}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"lit": "worldmap",
									},
									map[string]any{
										"var": "map",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"map",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"worldmap",
									"{map}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "mark_name",
											"orig": "mark_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/icon/{markName}",
								"rename": map[string]any{
									"param": map[string]any{
										"markName": "mark_name",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"lit": "icon",
									},
									map[string]any{
										"var": "mark_name",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"mark_name",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"icon",
									"{mark_name}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/map/worldmap",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "map",
									},
									map[string]any{
										"lit": "worldmap",
									},
								},
								"select": map[string]any{
									"$action": "worldmap",
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"map",
									"worldmap",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
						[]any{
							"api",
							"icon",
						},
						[]any{
							"api",
							"worldmap",
						},
						[]any{
							"api",
							"render",
						},
						[]any{
							"api",
							"map",
							"layer",
						},
					},
				},
			},
			"metric": map[string]any{
				"fields": []any{},
				"name": "metric",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/metrics/health",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "metrics",
									},
									map[string]any{
										"lit": "health",
									},
								},
								"select": map[string]any{
									"$action": "health",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"metrics",
									"health",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"mob": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "mob",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "max_level_filter",
											"orig": "max_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "min_level_filter",
											"orig": "min_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"count",
										"max_level_filter",
										"min_level_filter",
										"region",
										"search_for",
										"start_position",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "max_level_filter",
											"orig": "max_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "min_level_filter",
											"orig": "min_level_filter",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/count",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"lit": "count",
									},
								},
								"select": map[string]any{
									"$action": "count",
									"exist": []any{
										"count",
										"max_level_filter",
										"min_level_filter",
										"region",
										"search_for",
										"start_position",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"count",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "bg_color",
											"orig": "bg_color",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}/render/animated/{animation}",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"lit": "animated",
									},
									map[string]any{
										"var": "animation",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"animation",
										"bg_color",
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{id}",
									"render",
									"animated",
									"{animation}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "move",
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "bg_color",
											"orig": "bg_color",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}/render/{animation}",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"var": "animation",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"animation",
										"bg_color",
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{id}",
									"render",
									"{animation}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "mob_id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "bg_color",
											"orig": "bg_color",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/animated/{mobId}/{animation}",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "mob_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"lit": "animated",
									},
									map[string]any{
										"var": "mob_id",
									},
									map[string]any{
										"var": "animation",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"animation",
										"bg_color",
										"mob_id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"animated",
									"{mob_id}",
									"{animation}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "param",
											"name": "frame",
											"orig": "frame",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "mob_id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}/render/{animation}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "mob_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "mob_id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"animation",
										"frame",
										"mob_id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{mob_id}",
									"render",
									"{animation}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "sound_name",
											"orig": "sound_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}/sound/{soundName}",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "id",
										"soundName": "sound_name",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "sound",
									},
									map[string]any{
										"var": "sound_name",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"sound_name",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{id}",
									"sound",
									"{sound_name}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}/download",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "download",
									},
								},
								"select": map[string]any{
									"$action": "download",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{id}",
									"download",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}/icon",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "icon",
									},
								},
								"select": map[string]any{
									"$action": "icon",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{id}",
									"icon",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}/name",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "name",
									},
								},
								"select": map[string]any{
									"$action": "name",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{id}",
									"name",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "mob_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/mob/{mobId}/sound",
								"rename": map[string]any{
									"param": map[string]any{
										"mobId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "mob",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "sound",
									},
								},
								"select": map[string]any{
									"$action": "sound",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"mob",
									"{id}",
									"sound",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
						[]any{
							"api",
							"animated",
						},
						[]any{
							"api",
							"render",
						},
						[]any{
							"api",
							"sound",
						},
						[]any{
							"api",
							"mob",
							"render",
						},
					},
				},
			},
			"music": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "music",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "song_path",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/music/{songPath}",
								"rename": map[string]any{
									"param": map[string]any{
										"songPath": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "music",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"music",
									"{id}",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
					},
				},
			},
			"name": map[string]any{
				"fields": []any{},
				"name": "name",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "ring_ids_joined",
											"orig": "ring_ids_joined",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/name",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "name",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"name",
										"region",
										"ring_ids_joined",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"name",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
					},
				},
			},
			"npc": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "npc",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "framebook",
											"orig": "framebook",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "npc_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "animation",
											"orig": "animation",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "bg_color",
											"orig": "bg_color",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/npc/{npcId}/render/animated/{framebook}",
								"rename": map[string]any{
									"param": map[string]any{
										"npcId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "npc",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"lit": "animated",
									},
									map[string]any{
										"var": "framebook",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"animation",
										"bg_color",
										"framebook",
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"npc",
									"{id}",
									"render",
									"animated",
									"{framebook}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "framebook",
											"orig": "framebook",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "npc_id",
											"orig": "npc_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "bg_color",
											"orig": "bg_color",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "frame",
											"orig": "frame",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/npc/{npcId}/render/{framebook}/{frame}",
								"rename": map[string]any{
									"param": map[string]any{
										"npcId": "npc_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "npc",
									},
									map[string]any{
										"var": "npc_id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"var": "framebook",
									},
									map[string]any{
										"var": "frame",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"bg_color",
										"frame",
										"framebook",
										"npc_id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"npc",
									"{npc_id}",
									"render",
									"{framebook}",
									"{frame}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": 2147483647,
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_at",
											"orig": "start_at",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/npc",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "npc",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"count",
										"region",
										"search_for",
										"start_at",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"npc",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": 2147483647,
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_at",
											"orig": "start_at",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/npc/count",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "npc",
									},
									map[string]any{
										"lit": "count",
									},
								},
								"select": map[string]any{
									"$action": "count",
									"exist": []any{
										"count",
										"region",
										"search_for",
										"start_at",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"npc",
									"count",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "npc_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/npc/{npcId}",
								"rename": map[string]any{
									"param": map[string]any{
										"npcId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "npc",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"npc",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "npc_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/npc/{npcId}/download",
								"rename": map[string]any{
									"param": map[string]any{
										"npcId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "npc",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "download",
									},
								},
								"select": map[string]any{
									"$action": "download",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"npc",
									"{id}",
									"download",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "npc_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/npc/{npcId}/icon",
								"rename": map[string]any{
									"param": map[string]any{
										"npcId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "npc",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "icon",
									},
								},
								"select": map[string]any{
									"$action": "icon",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"npc",
									"{id}",
									"icon",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "npc_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/npc/{npcId}/name",
								"rename": map[string]any{
									"param": map[string]any{
										"npcId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "npc",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "name",
									},
								},
								"select": map[string]any{
									"$action": "name",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"npc",
									"{id}",
									"name",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
						[]any{
							"api",
							"animated",
						},
						[]any{
							"api",
							"npc",
							"render",
						},
					},
				},
			},
			"nxf": map[string]any{
				"fields": []any{},
				"name": "nxf",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/about",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "about",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"about",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/banners",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "banners",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"banners",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"performance_metric": map[string]any{
				"fields": []any{
					map[string]any{
						"format": "int64",
						"name": "activeRequests",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "double",
						"name": "averageResponseTimeMs",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "cache",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "errorsByType",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"format": "date-time",
						"name": "lastUpdated",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "int64",
						"name": "memoryUsedBytes",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "redisCache",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"format": "double",
						"name": "requestsPerSecond",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"format": "date-time",
						"name": "startTime",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "system",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"format": "int64",
						"name": "totalErrors",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "totalRequests",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "wzPropertiesLoaded",
						"type": "`$INTEGER`",
					},
				},
				"name": "performance_metric",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/metrics",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "metrics",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"metrics",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"pet": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "pet",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "stand0",
											"kind": "param",
											"name": "animation",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "pet_id",
											"orig": "pet_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "frame",
											"orig": "frame",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": -1,
											"kind": "query",
											"name": "pet_equip",
											"orig": "pet_equip",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/pet/{petId}/render/{animation}/{frame}/{petEquip}",
								"rename": map[string]any{
									"param": map[string]any{
										"petEquip": "pet_equip",
										"petId": "pet_id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "pet",
									},
									map[string]any{
										"var": "pet_id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"var": "animation",
									},
									map[string]any{
										"var": "frame",
									},
									map[string]any{
										"var": "pet_equip",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"animation",
										"frame",
										"pet_equip",
										"pet_id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"pet",
									"{pet_id}",
									"render",
									"{animation}",
									"{frame}",
									"{pet_equip}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "pet_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "stand0",
											"kind": "param",
											"name": "render_id",
											"orig": "animation",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": "",
											"kind": "query",
											"name": "bg_color",
											"orig": "bg_color",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": -1,
											"kind": "query",
											"name": "pet_equip",
											"orig": "pet_equip",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/pet/{petId}/render/{animation}/animated/{petEquip}",
								"rename": map[string]any{
									"param": map[string]any{
										"animation": "render_id",
										"petEquip": "pet_equip",
										"petId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "pet",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "render",
									},
									map[string]any{
										"var": "render_id",
									},
									map[string]any{
										"lit": "animated",
									},
									map[string]any{
										"var": "pet_equip",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"bg_color",
										"id",
										"pet_equip",
										"region",
										"render_id",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"pet",
									"{id}",
									"render",
									"{render_id}",
									"animated",
									"{pet_equip}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "pet_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/pet/{petId}",
								"rename": map[string]any{
									"param": map[string]any{
										"petId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "pet",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"pet",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "pet_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/pet/{petId}/actions",
								"rename": map[string]any{
									"param": map[string]any{
										"petId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "pet",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "actions",
									},
								},
								"select": map[string]any{
									"$action": "action",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"pet",
									"{id}",
									"actions",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "pet_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/pet/{petId}/download",
								"rename": map[string]any{
									"param": map[string]any{
										"petId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "pet",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "download",
									},
								},
								"select": map[string]any{
									"$action": "download",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"pet",
									"{id}",
									"download",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "pet_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/pet/{petId}/name",
								"rename": map[string]any{
									"param": map[string]any{
										"petId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "pet",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "name",
									},
								},
								"select": map[string]any{
									"$action": "name",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"pet",
									"{id}",
									"name",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/pet",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "pet",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"pet",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/pet/count",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "pet",
									},
									map[string]any{
										"lit": "count",
									},
								},
								"select": map[string]any{
									"$action": "count",
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"pet",
									"count",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
						[]any{
							"api",
							"render",
							"animated",
						},
						[]any{
							"api",
							"pet",
							"render",
						},
					},
				},
			},
			"quest": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "quest",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/quest",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "quest",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"count",
										"region",
										"search_for",
										"start_position",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"quest",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "count",
											"orig": "count",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "search_for",
											"orig": "search_for",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start_position",
											"orig": "start_position",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/quest/count",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "quest",
									},
									map[string]any{
										"lit": "count",
									},
								},
								"select": map[string]any{
									"$action": "count",
									"exist": []any{
										"count",
										"region",
										"search_for",
										"start_position",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"quest",
									"count",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "category",
											"orig": "category",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/quest/category/{category}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "quest",
									},
									map[string]any{
										"lit": "category",
									},
									map[string]any{
										"var": "category",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"category",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"quest",
									"category",
									"{category}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "quest_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/quest/{questId}",
								"rename": map[string]any{
									"param": map[string]any{
										"questId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "quest",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"quest",
									"{id}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "quest_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/quest/{questId}/icon",
								"rename": map[string]any{
									"param": map[string]any{
										"questId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "quest",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "icon",
									},
								},
								"select": map[string]any{
									"$action": "icon",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"quest",
									"{id}",
									"icon",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "quest_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/quest/{questId}/name",
								"rename": map[string]any{
									"param": map[string]any{
										"questId": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "quest",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "name",
									},
								},
								"select": map[string]any{
									"$action": "name",
									"exist": []any{
										"id",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"quest",
									"{id}",
									"name",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/quest/category",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "quest",
									},
									map[string]any{
										"lit": "category",
									},
								},
								"select": map[string]any{
									"$action": "category",
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"quest",
									"category",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
						[]any{
							"api",
							"category",
						},
					},
				},
			},
			"system": map[string]any{
				"fields": []any{
					map[string]any{
						"format": "double",
						"name": "cpuUsagePercent",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"format": "int64",
						"name": "gcGen0Collections",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "gcGen1Collections",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "gcGen2Collections",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int32",
						"name": "threadCount",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "totalMemoryBytes",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "usedMemoryBytes",
						"type": "`$INTEGER`",
					},
				},
				"name": "system",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/metrics/system",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "metrics",
									},
									map[string]any{
										"lit": "system",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"metrics",
									"system",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"tip": map[string]any{
				"fields": []any{},
				"name": "tip",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/tips",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "tips",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"tips",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
					},
				},
			},
			"wzn": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
					"parts": []any{
						"region",
						"version",
						"path",
					},
					"sep": "/",
				},
				"name": "wzn",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "path",
											"orig": "path",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"example": false,
											"kind": "query",
											"name": "raw_image",
											"orig": "raw_image",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "region",
											"orig": "region",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/wz/export/{region}/{version}/{path}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "wz",
									},
									map[string]any{
										"lit": "export",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"var": "path",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"path",
										"raw_image",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"wz",
									"export",
									"{region}",
									"{version}",
									"{path}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "path",
											"orig": "path",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "region",
											"orig": "region",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/wz/audio/{region}/{version}/{path}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "wz",
									},
									map[string]any{
										"lit": "audio",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"var": "path",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"path",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"wz",
									"audio",
									"{region}",
									"{version}",
									"{path}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "path",
											"orig": "path",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "region",
											"orig": "region",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/wz/img/{region}/{version}/{path}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "wz",
									},
									map[string]any{
										"lit": "img",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"var": "path",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"path",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"wz",
									"img",
									"{region}",
									"{version}",
									"{path}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "path",
											"orig": "path",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "region",
											"orig": "region",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/wz/lookup/{region}/{version}/{path}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "wz",
									},
									map[string]any{
										"lit": "lookup",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"var": "path",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"path",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"wz",
									"lookup",
									"{region}",
									"{version}",
									"{path}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "path",
											"orig": "path",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "region",
											"orig": "region",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/wz/{region}/{version}/{path}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "wz",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"var": "path",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"path",
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"wz",
									"{region}",
									"{version}",
									"{path}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/wz",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "wz",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"wz",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"audio",
						},
						[]any{
							"export",
						},
						[]any{
							"img",
						},
						[]any{
							"lookup",
						},
						[]any{
							"wz",
						},
					},
				},
			},
			"z_map": map[string]any{
				"fields": []any{},
				"name": "z_map",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/zmap",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "zmap",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"zmap",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "region",
											"orig": "region",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "version",
											"orig": "version",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/{region}/{version}/zmap/smap",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"var": "region",
									},
									map[string]any{
										"var": "version",
									},
									map[string]any{
										"lit": "zmap",
									},
									map[string]any{
										"lit": "smap",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"region",
										"version",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"api",
									"{region}",
									"{version}",
									"zmap",
									"smap",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"api",
						},
					},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
