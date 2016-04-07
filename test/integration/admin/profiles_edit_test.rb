require 'test_helper'

class Admin::ProfilesEditTest < ActionDispatch::IntegrationTest
 

  def setup
    @user = users(:michael)
    @user.profile = profiles(:curtis)
  end

  # Not sure how an unsuccessful profile edit can be 
  # before pacing redstrictions on the name(breaking it to first and last), the street address and zipcode
  test "unsuccessful profile edit as an admin" do
  	log_in_as(@user)
    get edit_admin_user_profile_path(@user, @profile)
    assert_template 'admin/profiles/edit'
    patch admin_user_profile_path(@user, @profile), profile: {name: "", street: "", city: "", state: "", zipcode: ""}
    assert_template 'admin/profiles/edit'
  end
  
  test "successful profile edit as an admin" do
    #get edit_user_profile_path(@user, @profile)
    log_in_as(@user)
    get edit_admin_user_profile_path(@user, @profile)
    assert_template 'admin/profiles/edit'    
    patch admin_user_profile_path(@user,@profile), profile: {name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456" }      # "@user.profile.attributes" also works in place of the attributes
    assert_not flash.empty?
    assert_redirected_to admin_user_profile_path(@user, @profile)
    @user.profile.reload
  end

  # Currently been redirected to the home page, the friendly forwarded will be added later
  #test "successful profile edit with friendly forwarding" do
  #  get edit_user_profile_path(@user,@profile)
  #  log_in_as(@user)
  #  assert_redirected_to edit_user_profile_path(@user,@profile)
  #  patch user_profile_path(@user,@profiles), profile: { name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456" }
  #  assert_not flash.empty?
  #  assert_redirected_to user_profile_path(@user, @profile)
  #  @user.profile.reload
  #end
end

