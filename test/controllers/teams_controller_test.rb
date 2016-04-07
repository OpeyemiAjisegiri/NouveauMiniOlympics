require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @user.profile = profiles(:curtis)
    @other_user.profile = profiles(:bruce)
    @team = teams(:panthers)
  end

  # Should work without the admin user restriction
  # which would mean anyone can see the form using the url.
  #test "should get new" do
  #  get :new
  #  assert_response :success
  #end
    
  #test "should redirect create when not logged in as admin user" do
  #  log_in_as(@other_user)
  #  get '/admin/teams/new', id: @team
    # Commented out the flash[:danger] in admin_user function in the test controller
    # which led to 'assert' replacing 'assert_not'
    #assert_not flash.empty?
  #  assert flash.empty?
  #  assert_redirected_to user_profile_path(@other_user)
  #end


  #test "should redirect edit when not logged in as admin user" do
  #  log_in_as(@other_user)
  #  get :edit, id: @team
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
  #  assert flash.empty?
  #  assert_redirected_to user_profile_path(@other_user)
  #end

  #test "should redirect update when not logged in as admin user" do
  #  log_in_as(@other_user)
  #  patch :update, id: @team
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
  #  assert flash.empty?
  #  assert_redirected_to user_profile_path(@other_user)
  #end


  #test "should redirect edit when not logged in" do
  #  get :edit, id: @team
  #  assert_not flash.empty?
  #  assert_redirected_to login_url
  #end

  #test "should redirect update when not logged in" do
  #  patch :update, id: @team
  #  assert_not flash.empty?
  #  assert_redirected_to login_url
  #end


######## The above code commented out has been moved to the admin team controller  test ########
 

  test "should redirect index when not logged in" do
    get :index, id: @team
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect 'teams/new' when not logged in as Admin" do
    log_in_as(@other_user)
    get :show, id: :new
    #assert_not flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end
end
