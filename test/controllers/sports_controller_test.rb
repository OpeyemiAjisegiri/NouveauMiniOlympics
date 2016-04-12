require 'test_helper'

class SportsControllerTest < ActionController::TestCase

	def setup
	  @user = users(:michael)
    @other_user = users(:archer)
     @sport = sports(:one)
	end


  test "should redirect create when not logged in as admin user" do
    log_in_as(@other_user)
    get :new, id: @sport
    # Commented out the flash[:danger] in admin_user function in the test controller
    # which led to 'assert' replacing 'assert_not'
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end


  test "should redirect edit when not logged in as admin user" do
    log_in_as(@other_user)
    get :edit, id: @sport, sport: {sportname: "Futbal" }
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect update when not logged in as admin user" do
    log_in_as(@other_user)
    patch :update, id: @sport, sport: {sportname: "Futbal" }
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end


  test "should redirect edit when not logged in" do
    get :edit, id: @sport, sport: {sportname: "Futbal" }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @sport, sport: {sportname: "Futbal" }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
 

  test "should redirect index when not logged in" do
    get :index, id: @sport
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect 'sports/new' when not logged in as Admin" do
    log_in_as(@other_user)
    get :show, id: :new
    #assert_not flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end
end
