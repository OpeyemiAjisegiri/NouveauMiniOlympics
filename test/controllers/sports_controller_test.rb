require 'test_helper'

class SportsControllerTest < ActionController::TestCase

	def setup
	  @user = users(:michael)
    @other_user = users(:archer)
     @sport = sports(:one)
	end


  test "should redirect index when not logged in" do
    get :index, id: @sport
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect 'sports/new' when not logged in as Admin" do
    log_in_as(@other_user)
    get :show, id: :new
    #assert_not flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end
end
