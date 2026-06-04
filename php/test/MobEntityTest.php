<?php
declare(strict_types=1);

// Mob entity test

require_once __DIR__ . '/../maplestory_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class MobEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = MaplestorySDK::test(null, null);
        $ent = $testsdk->Mob(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = mob_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "mob." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set MAPLESTORY_TEST_MOB_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $mob_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.mob")));
        $mob_ref01_data = null;
        if (count($mob_ref01_data_raw) > 0) {
            $mob_ref01_data = Helpers::to_map($mob_ref01_data_raw[0][1]);
        }

        // LOAD
        $mob_ref01_ent = $client->Mob(null);
        $mob_ref01_match_dt0 = [];
        [$mob_ref01_data_dt0_loaded, $err] = $mob_ref01_ent->load($mob_ref01_match_dt0, null);
        $this->assertNull($err);
        $this->assertNotNull($mob_ref01_data_dt0_loaded);

    }
}

function mob_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/mob/MobTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = MaplestorySDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["mob01", "mob02", "mob03", "api01", "api02", "api03", "animated01", "animated02", "animated03", "render01", "render02", "render03", "sound01", "sound02", "sound03", "region01", "version01"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("MAPLESTORY_TEST_MOB_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "MAPLESTORY_TEST_MOB_ENTID" => $idmap,
        "MAPLESTORY_TEST_LIVE" => "FALSE",
        "MAPLESTORY_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["MAPLESTORY_TEST_MOB_ENTID"]);
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
