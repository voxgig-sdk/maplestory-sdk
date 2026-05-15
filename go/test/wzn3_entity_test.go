package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/maplestory-sdk"
	"github.com/voxgig-sdk/maplestory-sdk/core"

	vs "github.com/voxgig/struct"
)

func TestWzn3Entity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Wzn3(nil)
		if ent == nil {
			t.Fatal("expected non-nil Wzn3Entity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := wzn3BasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "wzn3." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set MAPLESTORY_TEST_WZN__ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		wzn3Ref01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.wzn3", setup.data)))
		var wzn3Ref01Data map[string]any
		if len(wzn3Ref01DataRaw) > 0 {
			wzn3Ref01Data = core.ToMapAny(wzn3Ref01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = wzn3Ref01Data

		// LOAD
		wzn3Ref01Ent := client.Wzn3(nil)
		wzn3Ref01MatchDt0 := map[string]any{}
		wzn3Ref01DataDt0Loaded, err := wzn3Ref01Ent.Load(wzn3Ref01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if wzn3Ref01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func wzn3BasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "wzn3", "Wzn3TestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read wzn3 test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse wzn3 test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"wzn301", "wzn302", "wzn303", "export01", "export02", "export03", "region01", "version01"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("MAPLESTORY_TEST_WZN__ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"MAPLESTORY_TEST_WZN__ENTID": idmap,
		"MAPLESTORY_TEST_LIVE":      "FALSE",
		"MAPLESTORY_TEST_EXPLAIN":   "FALSE",
		"MAPLESTORY_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["MAPLESTORY_TEST_WZN__ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["MAPLESTORY_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["MAPLESTORY_APIKEY"],
			},
			extra,
		})
		client = sdk.NewMaplestorySDK(core.ToMapAny(mergedOpts))
	}

	live := env["MAPLESTORY_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["MAPLESTORY_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
