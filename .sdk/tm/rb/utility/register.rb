# Maplestory SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

MaplestoryUtility.registrar = ->(u) {
  u.clean = MaplestoryUtilities::Clean
  u.done = MaplestoryUtilities::Done
  u.make_error = MaplestoryUtilities::MakeError
  u.feature_add = MaplestoryUtilities::FeatureAdd
  u.feature_hook = MaplestoryUtilities::FeatureHook
  u.feature_init = MaplestoryUtilities::FeatureInit
  u.fetcher = MaplestoryUtilities::Fetcher
  u.make_fetch_def = MaplestoryUtilities::MakeFetchDef
  u.make_context = MaplestoryUtilities::MakeContext
  u.make_options = MaplestoryUtilities::MakeOptions
  u.make_request = MaplestoryUtilities::MakeRequest
  u.make_response = MaplestoryUtilities::MakeResponse
  u.make_result = MaplestoryUtilities::MakeResult
  u.make_point = MaplestoryUtilities::MakePoint
  u.make_spec = MaplestoryUtilities::MakeSpec
  u.make_url = MaplestoryUtilities::MakeUrl
  u.param = MaplestoryUtilities::Param
  u.prepare_auth = MaplestoryUtilities::PrepareAuth
  u.prepare_body = MaplestoryUtilities::PrepareBody
  u.prepare_headers = MaplestoryUtilities::PrepareHeaders
  u.prepare_method = MaplestoryUtilities::PrepareMethod
  u.prepare_params = MaplestoryUtilities::PrepareParams
  u.prepare_path = MaplestoryUtilities::PreparePath
  u.prepare_query = MaplestoryUtilities::PrepareQuery
  u.result_basic = MaplestoryUtilities::ResultBasic
  u.result_body = MaplestoryUtilities::ResultBody
  u.result_headers = MaplestoryUtilities::ResultHeaders
  u.transform_request = MaplestoryUtilities::TransformRequest
  u.transform_response = MaplestoryUtilities::TransformResponse
}
