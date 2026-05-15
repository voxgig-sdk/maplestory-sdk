<?php
declare(strict_types=1);

// Maplestory SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class MaplestoryMakeContext
{
    public static function call(array $ctxmap, ?MaplestoryContext $basectx): MaplestoryContext
    {
        return new MaplestoryContext($ctxmap, $basectx);
    }
}
