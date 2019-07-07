require 'test_helper'

class CoinMarketCapTest < ActiveSupport::TestCase
	test "should return success response for get_list" do
  	stub_coin_market_cap_success_call_service
  	response = CoinMarketCap.get_list
  	assert_equal response["data"].present?, true
  end

  test "should return error response for get_list" do
  	stub_coin_market_cap_error_call_service
  	response = CoinMarketCap.get_list
  	assert_equal response["error_msg"], "Something went wrong. Please try again later"
  end

  test "should return exception response for get_list" do
  	CoinMarketCap.stubs(:call_service).returns(StandardError.new)
  	response = CoinMarketCap.get_list
  	assert_equal response["error_msg"], "Something went wrong. Please try again later"
  end
end
