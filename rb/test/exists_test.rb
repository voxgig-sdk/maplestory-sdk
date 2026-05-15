# Maplestory SDK exists test

require "minitest/autorun"
require_relative "../Maplestory_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = MaplestorySDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
