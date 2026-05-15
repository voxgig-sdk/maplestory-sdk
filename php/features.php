<?php
declare(strict_types=1);

// Maplestory SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class MaplestoryFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new MaplestoryBaseFeature();
            case "test":
                return new MaplestoryTestFeature();
            default:
                return new MaplestoryBaseFeature();
        }
    }
}
