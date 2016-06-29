require 'test_helper'

class Admin::MedalsEditTest < ActionDispatch::IntegrationTest
  
  def setup
   @user = users(:michael)
   @other_user = users(:archer)
   @sport = sports(:one)
   @medal = medals(:one)
   @team1 = teams(:bears)
   @team2 = teams(:panthers)
   @team3 = teams(:angels)
  end

  #test "only admin users can assign medals" do
    
  # end

  test "should redirect edit when not logged in as admin user" do
    log_in_as(@other_user)
    get edit_admin_sport_medal_path(@sport)
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect update when not logged in as admin user" do
    log_in_as(@other_user)
    patch admin_sport_medal_path(@sport)
  #  #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect edit when not logged in" do
    get edit_admin_sport_medal_path(@sport)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch admin_sport_medal_path(@sport)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

    # before pacing redstrictions on the name(breaking it to first and last), the street address and zipcode
  test "unsuccessful medal edit as an admin" do
  	log_in_as(@user)
    get edit_admin_sport_medal_path(@sport)
    assert_template 'admin/medals/edit'
    patch admin_sport_medal_path(@sport, @medal), medal: {gold_id: "", silver_id: "", bronze_id: ""}
    #patch_via_redirect admin_sport_path(@sport, @medal), medal: {gold_id: "", silver_id: "", bronze_id: ""}
    #assert_redirected_to admin_sport_path(@sport)
    assert_template 'admin/medals/edit'
  end
  
  test "successful profile edit as an admin" do
    log_in_as(@user)
    get edit_admin_sport_medal_path(@sport)
    assert_template 'admin/medals/edit'    
    patch admin_sport_medal_path(@sport, @medal), medal: {gold_id: @team3.id, silver_id: @team1.id, bronze_id: @team2.id}
    #patch_via_redirect admin_sport_path(@sport, @medal), medal: {gold_id: @team3.id, silver_id: @team1.id, bronze_id: @team2.id}
    assert_redirected_to admin_sport_path(@sport)
    assert_not flash.empty?
    assert_redirected_to admin_sport_path(@sport)
    @sport.reload
  end

end
