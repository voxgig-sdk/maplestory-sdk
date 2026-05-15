<?php
declare(strict_types=1);

// Maplestory SDK utility: result_headers

class MaplestoryResultHeaders
{
    public static function call(MaplestoryContext $ctx): ?MaplestoryResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
