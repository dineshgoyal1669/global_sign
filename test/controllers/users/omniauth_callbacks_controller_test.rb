require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get google_oauth2 redirect to listing page" do
  	stub_omniauth
  	user = users(:one)
  	User.stubs(:from_omniauth).returns(user)

    get user_google_oauth2_omniauth_callback_url
    assert_response :redirect
    assert_redirected_to root_url
  end

  test "should get google_oauth2 redirect to login page" do
  	stub_omniauth
  	User.stubs(:from_omniauth).returns(User.new)

    get user_google_oauth2_omniauth_callback_url
    assert_response :redirect
    assert_redirected_to new_user_session_url
  end
end