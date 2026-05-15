<?php
declare(strict_types=1);

// Maplestory SDK utility: prepare_body

class MaplestoryPrepareBody
{
    public static function call(MaplestoryContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
