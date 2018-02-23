require 'test_helper'

class ProfilesEditTest < ActionDispatch::IntegrationTest   

  def setup
    @user = users(:archer)
    @user.profile = profiles(:bruce)
  end

  # Not sure how an unsuccessful profile edit can be 
  # before pacing redstrictions on the name(breaking it to first and last), the street address and zipcode
  test "unsuccessful profile edit" do
  	log_in_as(@user)
    get edit_user_profile_path(@user, @profile)
    assert_template 'profiles/edit'
    patch user_profile_path(@user, @profile), params: { profile: {name: "", street: "", city: "", state: "", zipcode: ""} }
    assert_template 'profiles/edit'
  end
  
  test "successful profile edit " do
    #get edit_user_profile_path(@user, @profile)
    log_in_as(@user)
    get edit_user_profile_path(@user, @profile)
    assert_template 'profiles/edit'    
    patch user_profile_path(@user,@profile), params: { profile: { name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456" } }
    assert_not flash.empty?
    assert_redirected_to user_profile_path(@user, @profile)
    @user.profile.reload
  end

  # Currently been redirected to the home page, the friendly forwarded will be added later
  #test "successful profile edit with friendly forwarding" do
  #  get edit_user_profile_path(@user,@profile)
  #  log_in_as(@user)
  #  assert_redirected_to edit_user_profile_path(@user,@profile)
  #  patch user_profile_path(@user,@profiles), params: { profile: { name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456" } }
  #  assert_not flash.empty?
  #  assert_redirected_to user_profile_path(@user, @profile)
  #  @user.profile.reload
  #end
end
