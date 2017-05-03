require 'test_helper'

class Admin::SportsEditTest < ActionDispatch::IntegrationTest
 

  def setup
    @sport = sports(:one)
    @user = users(:michael)
    @other_user = users(:lana)
    @user.profile = profiles(:curtis)
  end

  test "unsuccessful sport edit without admin priviledges" do
    log_in_as(@other_user)
    get edit_admin_sport_path(@sport)
    ### No 'edit_sport_path' in routes.rb but the 
    ### non admin is supposed to be redirected to their profile
    assert_redirected_to user_profile_path(@other_user)
  end

  test "unsuccessful sport edit as an admin" do
  	log_in_as(@user)
    get edit_admin_sport_path(@sport)
    assert_template 'admin/sports/edit'
    patch admin_sport_path(@sport), sport: {sportname: ""}
    assert_template 'admin/sports/edit'
  end
  
  test "successful sport edit as an admin" do
    log_in_as(@user)
    get edit_admin_sport_path(@sport)
    assert_template 'admin/sports/edit'    
    patch admin_sport_path(@sport), sport: {sportname: "Football"}
    assert_not flash.empty?
    assert_redirected_to admin_sport_path(@sport)
    #assert_redirected_to @sport
    @sport.reload
  end
end