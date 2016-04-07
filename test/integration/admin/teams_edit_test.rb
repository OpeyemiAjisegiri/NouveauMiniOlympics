require 'test_helper'

class Admin::TeamsEditTest < ActionDispatch::IntegrationTest
 

  def setup
    @team = teams(:warriors)
    @user = users(:michael)
    @user.profile = profiles(:curtis)
  end

  test "unsuccessful team edit as an admin" do
  	log_in_as(@user)
    get edit_admin_team_path(@team)
    assert_template 'admin/teams/edit'
    patch admin_team_path(@team), team: {teamname: "", teamcolor: "" }
    assert_template 'admin/teams/edit'
  end
  
  test "successful team edit as an admin" do
    log_in_as(@user)
    get edit_admin_team_path(@team)
    assert_template 'admin/teams/edit'    
    patch admin_team_path(@team), team: {teamname: "Yellow Giants", teamcolor: "Yellow" }
    assert_not flash.empty?
    assert_redirected_to admin_team_path(@team)
    #assert_redirected_to @team
    @team.reload
  end
end