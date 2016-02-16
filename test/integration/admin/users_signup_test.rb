require 'test_helper'

class Admin::UsersSignupTest < ActionDispatch::IntegrationTest
 def setup
    #@user = User.new(email: "foobar@test.com", password: "foobar", password_confirmation: "foobar")
    #@profile = @user.profile = Profile.new(name: "Example Test", street: "24 Fred Rd", city: "Cutlin", state: "SW", zipcode: "35478")
 end
  
  test "invalid signup information as an admin" do
    get new_admin_user_path
    assert_no_difference 'User.count' do
      post admin_users_path, user: { #name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'admin/users/new'
    # Getting INvalid Selector for 'div#<..' and 'div.<..'
    # assert_select 'div#<CSS id for error explanation>'
    # assert_select 'div.<CSS class for field with error>'
  end

  # Editting  the test below to utilize user profile
  # and not just the user; the original test was commented out
 test "valid signup information as an admin" do
    get new_admin_user_path
    assert_difference 'User.count', 1 do

      ### Both sets of test works, with the first; I was trying to strictly follow how the 
      ### server log potrays the create action: inserts into both user and profile database then gets user's profile 
      ### but the line 'user.save' gave me concern leading to the second version. 
      ### Also, the issue of 'user_id' or the full user hash played a role.


      #user = User.new(email: "foobar@test.com", password: "foobar", password_confirmation: "foobar")
      #user.build_profile(name: "Micheal platini", street: "2 FIFA St.", city: "Waterloo", state: "SW", zipcode: "87634")
      #user.save
      #post users_path(user), user: user.attributes
      #get_via_redirect user_profile_path(user)
      #assert user_profile_path(user)


      #using 'post' in place of 'post_via_redirect' gives the error 'No route matches...missing keys: [:user_id]'
      # this is because 'post_via_redirect' posts to the user and session create action
      # thereby saving ang logging in the usr a la 'def log_in_as(..)' and 'def integration_test?' in the test_helper.rb file
      user = User.new
      user = {email: "foobar@test.com", password: "foobar", password_confirmation: "foobar", profile_attributes: {name: "Micheal platini", street: "2 FIFA St.", city: "Waterloo", state: "SW", zipcode: "87634"}}
      post_via_redirect admin_users_path(user), user: user
      ###  debugger
      get_via_redirect admin_user_profile_path(user), user: user
      assert user_profile_path(user)
    end
    assert_template 'admin/profiles/show'
    #assert is_logged_in?
  end
end
