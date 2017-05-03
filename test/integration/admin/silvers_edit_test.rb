require 'test_helper'
 
class Admin::SilversEditTest < ActionDispatch::IntegrationTest
	def setup
	   @user = users(:michael)
       @other_user = users(:archer)
       @sport = sports(:one)
       @sport.silver = @silver = silvers(:lat)
       @team = teams(:panthers)
       #@team2 = teams(:bears)
       #@team3 = teams(:angels)
	end

  #test "unsuccessful silver assigning as an admin" do
  #	log_in_as(@user)
  #  get medals_admin_sport_path(@sport)
  #  #get assign_medal_admin_sport_path(@sport)
  #  assert_template 'admin/sports/medals'
  #  patch assign_medal_admin_sport_path(@sport), silver: {team: ""}
  #  #debugger
  #  assert_template 'admin/sports/assign_medal'
  #end
  
  #test "successful silver assigning as an admin" do
  #  log_in_as(@user)
  #  get medals_admin_sport_path(@sport)
  #  assert_template 'admin/sports/medals'    
  #  patch assign_medal_admin_sport_path(@sport), sport: {:silver => {[:team] => @team}}  
  #  assert flash.empty?
  #  assert_redirected_to admin_sport_path(@sport)
  #  @sport.reload
  #end
end