require 'test_helper'

class Admin::ProfilesControllerTest < ActionController::TestCase
def setup
  	@user = users(:michael)
  	@profile = profiles(:curtis)
    @user.profile = @profile
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
