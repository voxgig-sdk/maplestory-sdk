<?php
declare(strict_types=1);

// Maplestory SDK utility: feature_add

class MaplestoryFeatureAdd
{
    public static function call(MaplestoryContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
