require 'test_helper'
 
class Admin::BronzesEditTest < ActionDispatch::IntegrationTest
	def setup
	   @user = users(:michael)
       @other_user = users(:archer)
       @sport = sports(:one)
       @sport.bronze = @bronze = bronze(:bran)
       @team = teams(:angels)
       #@team2 = teams(:bears)
       #@team3 = teams(:panthers)
	end

  #test "unsuccessful gold assigning as an admin" do
  #	log_in_as(@user)
  #  get medals_admin_sport_path(@sport)
  #	#get assign_medal_admin_sport_path(@sport)
  #  assert_template 'admin/sports/medals'
  #  patch assign_medal_admin_sport_path(@sport), bronze: {team: ""}
  #  #debugger
  #  assert_template 'admin/sports/assign_medal'
  #end
  
  #test "successful gold assigning as an admin" do
  #  log_in_as(@user)
  #  get medals_admin_sport_path(@sport)
  #  #get edit_admin_sport_gold_path(@sport)
  #  assert_template 'admin/sports/medals'    
  #  patch assign_medal_admin_sport_path(@sport), bronze: {team: @team} 	#{team_id: @team.id}
  #  assert_redirected_to admin_sport_path(@sport)
  #  assert_not flash.empty?
  #  assert_redirected_to admin_sport_path(@sport)
  #  @sport.reload
  #end
end