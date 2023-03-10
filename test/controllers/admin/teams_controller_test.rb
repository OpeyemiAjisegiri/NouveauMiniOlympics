require 'test_helper'

class Admin::TeamsControllerTest < ActionController::TestCase
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @team = teams(:panthers)
  end

  # Should work without the admin user restriction
  # which would mean anyone can see the form using the url.
  #test "should get new" do
  #  get :new
  #  assert_response :success
  #end
    
  test "should redirect create when not logged in as admin user" do
    log_in_as(@other_user)
    get :create, params: { id: @team }
    # Commented out the flash[:danger] in admin_user function in the test controller
    # which led to 'assert' replacing 'assert_not'
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end


  test "should redirect edit when not logged in as admin user" do
    log_in_as(@other_user)
    get :edit, params: { id: @team }
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect update when not logged in as admin user" do
    log_in_as(@other_user)
    patch :update, params: { id: @team }
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end


  test "should redirect create when not logged in" do
    get :create, params: { id: @team }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get :edit, params: { id: @team }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, params: { id: @team }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
