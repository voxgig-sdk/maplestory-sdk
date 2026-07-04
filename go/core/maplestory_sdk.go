package core

import (
	"fmt"

	vs "github.com/voxgig-sdk/maplestory-sdk/go/utility/struct"
)

type MaplestorySDK struct {
	Mode     string
	options  map[string]any
	utility  *Utility
	Features []Feature
	rootctx  *Context
}

func NewMaplestorySDK(options map[string]any) *MaplestorySDK {
	sdk := &MaplestorySDK{
		Mode:     "live",
		Features: []Feature{},
	}

	sdk.utility = NewUtility()

	config := MakeConfig()

	sdk.rootctx = sdk.utility.MakeContext(map[string]any{
		"client":  sdk,
		"utility": sdk.utility,
		"config":  config,
		"options": options,
		"shared":  map[string]any{},
	}, nil)

	sdk.options = sdk.utility.MakeOptions(sdk.rootctx)

	if vs.GetPath([]any{"feature", "test", "active"}, sdk.options) == true {
		sdk.Mode = "test"
	}

	sdk.rootctx.Options = sdk.options

	// Add features from config.
	featureOpts := ToMapAny(vs.GetProp(sdk.options, "feature"))
	if featureOpts != nil {
		for _, item := range vs.Items(featureOpts) {
			fname, _ := item[0].(string)
			fopts := ToMapAny(item[1])
			if fopts != nil {
				if active, ok := fopts["active"]; ok {
					if ab, ok := active.(bool); ok && ab {
						sdk.utility.FeatureAdd(sdk.rootctx, makeFeature(fname))
					}
				}
			}
		}
	}

	// Add extension features.
	if extend := vs.GetProp(sdk.options, "extend"); extend != nil {
		if extList, ok := extend.([]any); ok {
			for _, f := range extList {
				if feat, ok := f.(Feature); ok {
					sdk.utility.FeatureAdd(sdk.rootctx, feat)
				}
			}
		}
	}

	// Initialize features.
	for _, f := range sdk.Features {
		sdk.utility.FeatureInit(sdk.rootctx, f)
	}

	sdk.utility.FeatureHook(sdk.rootctx, "PostConstruct")

	return sdk
}

func (sdk *MaplestorySDK) OptionsMap() map[string]any {
	out := vs.Clone(sdk.options)
	if om, ok := out.(map[string]any); ok {
		return om
	}
	return map[string]any{}
}

func (sdk *MaplestorySDK) GetUtility() *Utility {
	return CopyUtility(sdk.utility)
}

func (sdk *MaplestorySDK) GetRootCtx() *Context {
	return sdk.rootctx
}

func (sdk *MaplestorySDK) Prepare(fetchargs map[string]any) (map[string]any, error) {
	utility := sdk.utility

	if fetchargs == nil {
		fetchargs = map[string]any{}
	}

	var ctrl map[string]any
	if c := vs.GetProp(fetchargs, "ctrl"); c != nil {
		if cm, ok := c.(map[string]any); ok {
			ctrl = cm
		}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	ctx := utility.MakeContext(map[string]any{
		"opname": "prepare",
		"ctrl":   ctrl,
	}, sdk.rootctx)

	options := sdk.options

	path, _ := vs.GetProp(fetchargs, "path").(string)
	method, _ := vs.GetProp(fetchargs, "method").(string)
	if method == "" {
		method = "GET"
	}

	params := ToMapAny(vs.GetProp(fetchargs, "params"))
	if params == nil {
		params = map[string]any{}
	}
	query := ToMapAny(vs.GetProp(fetchargs, "query"))
	if query == nil {
		query = map[string]any{}
	}

	headers := utility.PrepareHeaders(ctx)

	base, _ := vs.GetProp(options, "base").(string)
	prefix, _ := vs.GetProp(options, "prefix").(string)
	suffix, _ := vs.GetProp(options, "suffix").(string)

	ctx.Spec = NewSpec(map[string]any{
		"base":    base,
		"prefix":  prefix,
		"suffix":  suffix,
		"path":    path,
		"method":  method,
		"params":  params,
		"query":   query,
		"headers": headers,
		"body":    vs.GetProp(fetchargs, "body"),
		"step":    "start",
	})

	// Merge user-provided headers.
	if uh := vs.GetProp(fetchargs, "headers"); uh != nil {
		if uhm, ok := uh.(map[string]any); ok {
			for k, v := range uhm {
				ctx.Spec.Headers[k] = v
			}
		}
	}

	_, err := utility.PrepareAuth(ctx)
	if err != nil {
		return nil, err
	}

	return utility.MakeFetchDef(ctx)
}

func (sdk *MaplestorySDK) Direct(fetchargs map[string]any) (map[string]any, error) {
	utility := sdk.utility

	fetchdef, err := sdk.Prepare(fetchargs)
	if err != nil {
		return map[string]any{"ok": false, "err": err}, nil
	}

	if fetchargs == nil {
		fetchargs = map[string]any{}
	}

	var ctrl map[string]any
	if c := vs.GetProp(fetchargs, "ctrl"); c != nil {
		if cm, ok := c.(map[string]any); ok {
			ctrl = cm
		}
	}
	if ctrl == nil {
		ctrl = map[string]any{}
	}

	ctx := utility.MakeContext(map[string]any{
		"opname": "direct",
		"ctrl":   ctrl,
	}, sdk.rootctx)

	url, _ := fetchdef["url"].(string)
	fetched, fetchErr := utility.Fetcher(ctx, url, fetchdef)

	if fetchErr != nil {
		return map[string]any{"ok": false, "err": fetchErr}, nil
	}

	if fetched == nil {
		return map[string]any{
			"ok":  false,
			"err": ctx.MakeError("direct_no_response", "response: undefined"),
		}, nil
	}

	if fm, ok := fetched.(map[string]any); ok {
		status := ToInt(vs.GetProp(fm, "status"))
		headers := vs.GetProp(fm, "headers")

		// No-body responses (204, 304) and explicit zero content-length
		// must skip JSON parsing — calling json() on an empty body errors.
		var contentLength string
		if hm, ok := headers.(map[string]any); ok {
			if cl, ok := hm["content-length"]; ok {
				contentLength = fmt.Sprintf("%v", cl)
			}
		}
		noBody := status == 204 || status == 304 || contentLength == "0"

		var jsonData any
		if !noBody {
			if jf := vs.GetProp(fm, "json"); jf != nil {
				if f, ok := jf.(func() any); ok {
					// f() returns nil on parse error in our fetcher.
					jsonData = f()
				}
			}
		}

		return map[string]any{
			"ok":      status >= 200 && status < 300,
			"status":  status,
			"headers": headers,
			"data":    jsonData,
		}, nil
	}

	return map[string]any{"ok": false, "err": ctx.MakeError("direct_invalid", "invalid response type")}, nil
}


// Android returns a Android entity bound to this client.
// Idiomatic usage: client.Android(nil).List(nil, nil) or
// client.Android(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Android(data map[string]any) MaplestoryEntity {
	return NewAndroidEntityFunc(sdk, data)
}


// Avatar returns a Avatar entity bound to this client.
// Idiomatic usage: client.Avatar(nil).List(nil, nil) or
// client.Avatar(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Avatar(data map[string]any) MaplestoryEntity {
	return NewAvatarEntityFunc(sdk, data)
}


// Cache returns a Cache entity bound to this client.
// Idiomatic usage: client.Cache(nil).List(nil, nil) or
// client.Cache(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Cache(data map[string]any) MaplestoryEntity {
	return NewCacheEntityFunc(sdk, data)
}


// Character returns a Character entity bound to this client.
// Idiomatic usage: client.Character(nil).List(nil, nil) or
// client.Character(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Character(data map[string]any) MaplestoryEntity {
	return NewCharacterEntityFunc(sdk, data)
}


// Chat returns a Chat entity bound to this client.
// Idiomatic usage: client.Chat(nil).List(nil, nil) or
// client.Chat(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Chat(data map[string]any) MaplestoryEntity {
	return NewChatEntityFunc(sdk, data)
}


// Cluster returns a Cluster entity bound to this client.
// Idiomatic usage: client.Cluster(nil).List(nil, nil) or
// client.Cluster(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Cluster(data map[string]any) MaplestoryEntity {
	return NewClusterEntityFunc(sdk, data)
}


// Diff returns a Diff entity bound to this client.
// Idiomatic usage: client.Diff(nil).List(nil, nil) or
// client.Diff(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Diff(data map[string]any) MaplestoryEntity {
	return NewDiffEntityFunc(sdk, data)
}


// Entity1 returns a Entity1 entity bound to this client.
// Idiomatic usage: client.Entity1(nil).List(nil, nil) or
// client.Entity1(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Entity1(data map[string]any) MaplestoryEntity {
	return NewEntity1EntityFunc(sdk, data)
}


// GmsNew returns a GmsNew entity bound to this client.
// Idiomatic usage: client.GmsNew(nil).List(nil, nil) or
// client.GmsNew(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) GmsNew(data map[string]any) MaplestoryEntity {
	return NewGmsNewEntityFunc(sdk, data)
}


// GuildMark returns a GuildMark entity bound to this client.
// Idiomatic usage: client.GuildMark(nil).List(nil, nil) or
// client.GuildMark(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) GuildMark(data map[string]any) MaplestoryEntity {
	return NewGuildMarkEntityFunc(sdk, data)
}


// Health returns a Health entity bound to this client.
// Idiomatic usage: client.Health(nil).List(nil, nil) or
// client.Health(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Health(data map[string]any) MaplestoryEntity {
	return NewHealthEntityFunc(sdk, data)
}


// Item returns a Item entity bound to this client.
// Idiomatic usage: client.Item(nil).List(nil, nil) or
// client.Item(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Item(data map[string]any) MaplestoryEntity {
	return NewItemEntityFunc(sdk, data)
}


// Job returns a Job entity bound to this client.
// Idiomatic usage: client.Job(nil).List(nil, nil) or
// client.Job(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Job(data map[string]any) MaplestoryEntity {
	return NewJobEntityFunc(sdk, data)
}


// Map returns a Map entity bound to this client.
// Idiomatic usage: client.Map(nil).List(nil, nil) or
// client.Map(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Map(data map[string]any) MaplestoryEntity {
	return NewMapEntityFunc(sdk, data)
}


// Metric returns a Metric entity bound to this client.
// Idiomatic usage: client.Metric(nil).List(nil, nil) or
// client.Metric(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Metric(data map[string]any) MaplestoryEntity {
	return NewMetricEntityFunc(sdk, data)
}


// Mob returns a Mob entity bound to this client.
// Idiomatic usage: client.Mob(nil).List(nil, nil) or
// client.Mob(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Mob(data map[string]any) MaplestoryEntity {
	return NewMobEntityFunc(sdk, data)
}


// Music returns a Music entity bound to this client.
// Idiomatic usage: client.Music(nil).List(nil, nil) or
// client.Music(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Music(data map[string]any) MaplestoryEntity {
	return NewMusicEntityFunc(sdk, data)
}


// Name returns a Name entity bound to this client.
// Idiomatic usage: client.Name(nil).List(nil, nil) or
// client.Name(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Name(data map[string]any) MaplestoryEntity {
	return NewNameEntityFunc(sdk, data)
}


// Npc returns a Npc entity bound to this client.
// Idiomatic usage: client.Npc(nil).List(nil, nil) or
// client.Npc(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Npc(data map[string]any) MaplestoryEntity {
	return NewNpcEntityFunc(sdk, data)
}


// Nxf returns a Nxf entity bound to this client.
// Idiomatic usage: client.Nxf(nil).List(nil, nil) or
// client.Nxf(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Nxf(data map[string]any) MaplestoryEntity {
	return NewNxfEntityFunc(sdk, data)
}


// PerformanceMetric returns a PerformanceMetric entity bound to this client.
// Idiomatic usage: client.PerformanceMetric(nil).List(nil, nil) or
// client.PerformanceMetric(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) PerformanceMetric(data map[string]any) MaplestoryEntity {
	return NewPerformanceMetricEntityFunc(sdk, data)
}


// Pet returns a Pet entity bound to this client.
// Idiomatic usage: client.Pet(nil).List(nil, nil) or
// client.Pet(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Pet(data map[string]any) MaplestoryEntity {
	return NewPetEntityFunc(sdk, data)
}


// Quest returns a Quest entity bound to this client.
// Idiomatic usage: client.Quest(nil).List(nil, nil) or
// client.Quest(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Quest(data map[string]any) MaplestoryEntity {
	return NewQuestEntityFunc(sdk, data)
}


// System returns a System entity bound to this client.
// Idiomatic usage: client.System(nil).List(nil, nil) or
// client.System(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) System(data map[string]any) MaplestoryEntity {
	return NewSystemEntityFunc(sdk, data)
}


// Tip returns a Tip entity bound to this client.
// Idiomatic usage: client.Tip(nil).List(nil, nil) or
// client.Tip(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Tip(data map[string]any) MaplestoryEntity {
	return NewTipEntityFunc(sdk, data)
}


// Wzn returns a Wzn entity bound to this client.
// Idiomatic usage: client.Wzn(nil).List(nil, nil) or
// client.Wzn(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Wzn(data map[string]any) MaplestoryEntity {
	return NewWznEntityFunc(sdk, data)
}


// Wzn2 returns a Wzn2 entity bound to this client.
// Idiomatic usage: client.Wzn2(nil).List(nil, nil) or
// client.Wzn2(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Wzn2(data map[string]any) MaplestoryEntity {
	return NewWzn2EntityFunc(sdk, data)
}


// Wzn3 returns a Wzn3 entity bound to this client.
// Idiomatic usage: client.Wzn3(nil).List(nil, nil) or
// client.Wzn3(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Wzn3(data map[string]any) MaplestoryEntity {
	return NewWzn3EntityFunc(sdk, data)
}


// Wzn4 returns a Wzn4 entity bound to this client.
// Idiomatic usage: client.Wzn4(nil).List(nil, nil) or
// client.Wzn4(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Wzn4(data map[string]any) MaplestoryEntity {
	return NewWzn4EntityFunc(sdk, data)
}


// Wzn5 returns a Wzn5 entity bound to this client.
// Idiomatic usage: client.Wzn5(nil).List(nil, nil) or
// client.Wzn5(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Wzn5(data map[string]any) MaplestoryEntity {
	return NewWzn5EntityFunc(sdk, data)
}


// Wzn6 returns a Wzn6 entity bound to this client.
// Idiomatic usage: client.Wzn6(nil).List(nil, nil) or
// client.Wzn6(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) Wzn6(data map[string]any) MaplestoryEntity {
	return NewWzn6EntityFunc(sdk, data)
}


// ZMap returns a ZMap entity bound to this client.
// Idiomatic usage: client.ZMap(nil).List(nil, nil) or
// client.ZMap(nil).Load(map[string]any{"id": ...}, nil).
func (sdk *MaplestorySDK) ZMap(data map[string]any) MaplestoryEntity {
	return NewZMapEntityFunc(sdk, data)
}



func TestSDK(testopts map[string]any, sdkopts map[string]any) *MaplestorySDK {
	if sdkopts == nil {
		sdkopts = map[string]any{}
	}
	sdkopts = vs.Clone(sdkopts).(map[string]any)

	if testopts == nil {
		testopts = map[string]any{}
	}
	testopts = vs.Clone(testopts).(map[string]any)
	testopts["active"] = true

	vs.SetPath(sdkopts, []any{"feature", "test"}, testopts)

	sdk := NewMaplestorySDK(sdkopts)
	sdk.Mode = "test"

	return sdk
}
