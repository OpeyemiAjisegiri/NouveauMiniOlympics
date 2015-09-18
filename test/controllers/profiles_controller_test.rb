require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  def setup
  	@user = users(:michael)
  	# The three lines works, '@user.build_profile()' builds association, 
  	# 'profile(:curtis)' loves fixture..
  	#@profile = Profile.new( name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456", user_id: @user.id)
  	#@profile = @user.build_profile( name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456")
  	@profile = profiles(:curtis)
    @user.profile = @profile
   # @other_user = users(:archer)
  end




  #test "user id should be present" do
   # @profile.user_id != nil
   # assert @profile.valid?
  #end

 # test "should redirect edit when not logged in" do
  #  get :edit, user_id: @profile.user
    #assert_not flash.empty?
  #  assert_redirected_to login_url
  #end

 #test "should redirect update when not logged in" do
 # patch :update, user_id: @profile.user_id, profile:{ name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456" }
 # assert_not flash.empty?
 # assert_redirected_to login_url
 #end 
end
