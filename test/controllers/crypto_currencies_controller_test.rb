require 'test_helper'

class CryptoCurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get success index" do
  	stub_coin_market_cap_success_call_service

    get root_url
    assert_response :success
  end
end
