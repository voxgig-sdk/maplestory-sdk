<?php
declare(strict_types=1);

// ZMap entity test

require_once __DIR__ . '/../maplestory_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class ZMapEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = MaplestorySDK::test(null, null);
        $ent = $testsdk->ZMap(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = z_map_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "z_map." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set MAPLESTORY_TEST_Z_MAP_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $z_map_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.z_map")));
        $z_map_ref01_data = null;
        if (count($z_map_ref01_data_raw) > 0) {
            $z_map_ref01_data = Helpers::to_map($z_map_ref01_data_raw[0][1]);
        }

        // LOAD
        $z_map_ref01_ent = $client->ZMap(null);
        $z_map_ref01_match_dt0 = [];
        $z_map_ref01_data_dt0_loaded = $z_map_ref01_ent->load($z_map_ref01_match_dt0, null);
        $this->assertNotNull($z_map_ref01_data_dt0_loaded);

    }
}

function z_map_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/z_map/ZMapTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = MaplestorySDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["z_map01", "z_map02", "z_map03", "api01", "api02", "api03", "region01"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("MAPLESTORY_TEST_Z_MAP_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "MAPLESTORY_TEST_Z_MAP_ENTID" => $idmap,
        "MAPLESTORY_TEST_LIVE" => "FALSE",
        "MAPLESTORY_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["MAPLESTORY_TEST_Z_MAP_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["MAPLESTORY_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
            ],
            $extra ?? [],
        ]);
        $client = new MaplestorySDK(Helpers::to_map($merged_opts));
    }

    $live = $env["MAPLESTORY_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["MAPLESTORY_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
