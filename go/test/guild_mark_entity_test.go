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

func TestGuildMarkEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.GuildMark(nil)
		if ent == nil {
			t.Fatal("expected non-nil GuildMarkEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := guild_markBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "guild_mark." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set MAPLESTORY_TEST_GUILD_MARK_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		guildMarkRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.guild_mark", setup.data)))
		var guildMarkRef01Data map[string]any
		if len(guildMarkRef01DataRaw) > 0 {
			guildMarkRef01Data = core.ToMapAny(guildMarkRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = guildMarkRef01Data

		// LOAD
		guildMarkRef01Ent := client.GuildMark(nil)
		guildMarkRef01MatchDt0 := map[string]any{}
		guildMarkRef01DataDt0Loaded, err := guildMarkRef01Ent.Load(guildMarkRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if guildMarkRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func guild_markBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "guild_mark", "GuildMarkTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read guild_mark test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse guild_mark test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"guild_mark01", "guild_mark02", "guild_mark03", "api01", "api02", "api03", "background01", "background02", "background03", "mark01", "mark02", "mark03", "region01", "version01"},
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
	entidEnvRaw := os.Getenv("MAPLESTORY_TEST_GUILD_MARK_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"MAPLESTORY_TEST_GUILD_MARK_ENTID": idmap,
		"MAPLESTORY_TEST_LIVE":      "FALSE",
		"MAPLESTORY_TEST_EXPLAIN":   "FALSE",
		"MAPLESTORY_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["MAPLESTORY_TEST_GUILD_MARK_ENTID"])
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
