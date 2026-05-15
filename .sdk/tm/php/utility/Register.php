<?php
declare(strict_types=1);

// Maplestory SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

MaplestoryUtility::setRegistrar(function (MaplestoryUtility $u): void {
    $u->clean = [MaplestoryClean::class, 'call'];
    $u->done = [MaplestoryDone::class, 'call'];
    $u->make_error = [MaplestoryMakeError::class, 'call'];
    $u->feature_add = [MaplestoryFeatureAdd::class, 'call'];
    $u->feature_hook = [MaplestoryFeatureHook::class, 'call'];
    $u->feature_init = [MaplestoryFeatureInit::class, 'call'];
    $u->fetcher = [MaplestoryFetcher::class, 'call'];
    $u->make_fetch_def = [MaplestoryMakeFetchDef::class, 'call'];
    $u->make_context = [MaplestoryMakeContext::class, 'call'];
    $u->make_options = [MaplestoryMakeOptions::class, 'call'];
    $u->make_request = [MaplestoryMakeRequest::class, 'call'];
    $u->make_response = [MaplestoryMakeResponse::class, 'call'];
    $u->make_result = [MaplestoryMakeResult::class, 'call'];
    $u->make_point = [MaplestoryMakePoint::class, 'call'];
    $u->make_spec = [MaplestoryMakeSpec::class, 'call'];
    $u->make_url = [MaplestoryMakeUrl::class, 'call'];
    $u->param = [MaplestoryParam::class, 'call'];
    $u->prepare_auth = [MaplestoryPrepareAuth::class, 'call'];
    $u->prepare_body = [MaplestoryPrepareBody::class, 'call'];
    $u->prepare_headers = [MaplestoryPrepareHeaders::class, 'call'];
    $u->prepare_method = [MaplestoryPrepareMethod::class, 'call'];
    $u->prepare_params = [MaplestoryPrepareParams::class, 'call'];
    $u->prepare_path = [MaplestoryPreparePath::class, 'call'];
    $u->prepare_query = [MaplestoryPrepareQuery::class, 'call'];
    $u->result_basic = [MaplestoryResultBasic::class, 'call'];
    $u->result_body = [MaplestoryResultBody::class, 'call'];
    $u->result_headers = [MaplestoryResultHeaders::class, 'call'];
    $u->transform_request = [MaplestoryTransformRequest::class, 'call'];
    $u->transform_response = [MaplestoryTransformResponse::class, 'call'];
});
