<?php
declare(strict_types=1);

// Maplestory SDK utility: result_body

class MaplestoryResultBody
{
    public static function call(MaplestoryContext $ctx): ?MaplestoryResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
