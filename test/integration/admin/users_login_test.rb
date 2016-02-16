require 'test_helper'

class Admin::UsersLoginTest < ActionDispatch::IntegrationTest
def setup
    @user = users(:michael)
    #@user.profile = @profile = profiles(:bruce)
  end

  test "login with invalid information as an admin" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end


  test "login with valid information as an admin" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to admin_user_profile_path(@user)
    follow_redirect!
    assert_template 'admin/profiles/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", admin_user_profile_path(@user)  
  end

  # Test was failing because the line '<li><%= link_to "Log In", login_path %></li>' was removed from the header file 
  # and replaced with '<li><a href= /login><span class="glyphicon glyphicon-log-in"></span> Login</a></li>'. 
  # Therefore when the home page is loaded 'login_path' isn't found but rather 'a href = Log In'. Though the code works.
  # The test also passed when replacing the line '<li><%= link_to "Log In", login_path %></li>' with '<li><a href= "/login">Log In</a></li>'
  test "login with valid information followed by logout as an admin" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to admin_user_profile_path(@user)
    follow_redirect!
    assert_template 'profiles/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", admin_user_profile_path(@user)                #user_profile_path(@user,@profile)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    #assert_select "a[href=?]", root_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", admin_user_profile_path(@user), count: 0
  end

  test "login with remembering as an admin" do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
    ## When using the instance of self this line becomes....below; also the "FILL_IN" part needs to be filled in 
    #assert_equal FILL_IN, assigns(:user).FILL_IN
  end

  test "login without remembering as an admin" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
