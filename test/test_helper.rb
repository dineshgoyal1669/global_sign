ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def stub_coin_market_cap_success_call_service
  	list_response = File.read('test/fixtures/api_responses/coin_market_cap_success.json')
    json_response = JSON.parse(list_response)
    json_response.stubs(:code).returns(200)
    CoinMarketCap.stubs(:call_service).returns(json_response)
  end

  def stub_coin_market_cap_error_call_service
  	list_response = File.read('test/fixtures/api_responses/coin_market_cap_error.json')
    json_response = JSON.parse(list_response)
    json_response.stubs(:code).returns(400)
    CoinMarketCap.stubs(:call_service).returns(json_response)
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({

    })
  end
end
