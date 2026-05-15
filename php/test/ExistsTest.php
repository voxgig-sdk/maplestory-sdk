<?php
declare(strict_types=1);

// Maplestory SDK exists test

require_once __DIR__ . '/../maplestory_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = MaplestorySDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
