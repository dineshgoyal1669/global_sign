require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should retutrn user from from_omniauth method without creating new user" do
  	user_count = User.count
  	auth = Object.new
  	data = HashWithIndifferentAccess.new(email: "test@test.com")
  	auth.stubs(:info).returns(data)
  	response = User.from_omniauth(auth)

  	assert_equal response.email, "test@test.com" 
  	assert_equal User.count, user_count   
  end

  test "should create user in from_omniauth method" do
  	User.destroy_all
  	user_count = User.count
  	auth = Object.new
  	data = HashWithIndifferentAccess.new(email: "test1@test.com")
  	auth.stubs(:info).returns(data)
  	response = User.from_omniauth(auth)

  	assert_equal response.email, "test1@test.com" 
  	assert_equal User.count, user_count+1 
  end
end
