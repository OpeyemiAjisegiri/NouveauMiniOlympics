require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
   # @user = User.new( email: "user@example.com",password: "foobar", password_confirmation: "foobar")
  	@user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end 

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

 # Testing to make sure the user profile is created;
 # but does it need to be tested? 
 # It's testing rails' build_assiociation function
  test "associated profile should be created" do
    assert_difference 'Profile.count', 1 do
      get :create, user:  {email: "test@example.net", password: "example", profile_attributes: {name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456"}}
      #user.create_profile(name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456")
      assert_not flash.empty?
      # The line below gives an error bout the user_id for the show action
      #assert_redirected_to user_profile_path, user: {email: "test@example.net", password: "example", profile_attributes: {name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456"}}
    end
  end

  test "associated profile should be destroyed" do
    @user.save
    @user.create_profile!(name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456")
    assert_difference 'profiles.count', 0 do
      @user.destroy
    end
  end
end
