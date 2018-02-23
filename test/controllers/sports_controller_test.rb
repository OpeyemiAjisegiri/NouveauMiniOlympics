require 'test_helper'

class SportsControllerTest < ActionController::TestCase

	def setup
	  @user = users(:michael)
    @other_user = users(:archer)
     @sport = sports(:one)
	end

  test "should get show" do 
    log_in_as(@other_user)
    get :show, params: { id: @sport }
    assert_response :success
  end

  test "should get index" do
    log_in_as(@other_user)
    get :index 
    assert_response :success 
  end  

  test "should redirect index when not logged in" do
    get :index  #, id: @sport
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect new when not logged in " do
    get :new
    assert_redirected_to login_url
  end

  test "should redirect new when not logged in as Admin" do
    log_in_as(@other_user)
    get :new
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect 'sports/new' when not logged in as Admin" do
    #### pretty much the same as redirecting new when not logged in as an Admin
    log_in_as(@other_user)
    get :show, params: { id: :new }
    #assert_not flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end


  test "should redirect new when not logged in as admin user" do
    log_in_as(@other_user)
    get :new
    # Commented out the flash[:danger] in admin_user function in the test controller
    # which led to 'assert' replacing 'assert_not'
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect create when not logged in as admin user" do
    log_in_as(@other_user)
    get :create, params: { id: @sport, sport: {sportname: "Football"} }
    # Commented out the flash[:danger] in admin_user function in the test controller
    # which led to 'assert' replacing 'assert_not'
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end


  test "should redirect edit when not logged in as admin user" do
    log_in_as(@other_user)
    get :edit, params:  { id: @sport, sport: {sportname: "Futbal" }}
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect update when not logged in as admin user" do
    log_in_as(@other_user)
    patch :update, params: { id: @sport, sport: {sportname: "Futbal" } }
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end


  test "should redirect edit when not logged in" do
    get :edit, params: { id: @sport, sport: {sportname: "Futbal" } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, params: { id: @sport, sport: {sportname: "Futbal" }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Sport.count' do
      delete :destroy, params: { id: @sport }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Sport.count' do
      delete :destroy, params: { id: @sport }
    end
    assert_redirected_to user_profile_path(@other_user)
  end

end
