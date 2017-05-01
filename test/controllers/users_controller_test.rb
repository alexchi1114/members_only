require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	def setup
	   	@base_title = "Members Only"
	   	@user = users()
	end

  	test "should get new" do
  		get signup_path
  		assert_response :success
  		assert_select "title", "Sign up | #{@base_title}"
 	end

 	test "should get index" do
 		get users_path
 		assert_response :success
 		assert_select "title", "Users | #{@base_title}"
 	end

end
