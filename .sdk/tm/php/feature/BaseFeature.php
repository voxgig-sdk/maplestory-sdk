<?php
declare(strict_types=1);

// Maplestory SDK base feature

class MaplestoryBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(MaplestoryContext $ctx, array $options): void {}
    public function PostConstruct(MaplestoryContext $ctx): void {}
    public function PostConstructEntity(MaplestoryContext $ctx): void {}
    public function SetData(MaplestoryContext $ctx): void {}
    public function GetData(MaplestoryContext $ctx): void {}
    public function GetMatch(MaplestoryContext $ctx): void {}
    public function SetMatch(MaplestoryContext $ctx): void {}
    public function PrePoint(MaplestoryContext $ctx): void {}
    public function PreSpec(MaplestoryContext $ctx): void {}
    public function PreRequest(MaplestoryContext $ctx): void {}
    public function PreResponse(MaplestoryContext $ctx): void {}
    public function PreResult(MaplestoryContext $ctx): void {}
    public function PreDone(MaplestoryContext $ctx): void {}
    public function PreUnexpected(MaplestoryContext $ctx): void {}
}
