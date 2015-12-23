require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:archer)
    @user.profile = profiles(:bruce)
  end

  test "unsuccessful user edit" do
  	log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "foo@invalid",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
  end

  test "successful user edit" do
  	log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    #name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), user: { email: email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to user_profile_path(@user)
    # Not using 'user_profile_path(@user)' because i'm not using the profile.id to 
    # search for the profile, but rather the foreign key 'user_id'; making the '@profile' redundant.
    @user.reload
    #assert_equal name,  @user.name
    assert_equal email, @user.email
  end

  test "successful user edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    #name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), user: { email: email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to user_profile_path(@user)
    # Not using 'user_profile_path(@user)' because i'm not using the profile.id to 
    # search for the profile, but rather the foreign key 'user_id'; making the '@profile' redundant.
    @user.reload
    # assert_equal name,  @user.name
    assert_equal email, @user.email
  end

end
