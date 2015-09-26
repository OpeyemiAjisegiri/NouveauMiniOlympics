require 'test_helper'

class TeamsEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    # Using michael because that's the only admin user fixture
    # and the team controller already test if a non admin user tries editting team .
    @team = teams(:panthers)
  end

  test "unsuccessful team edit" do
  	log_in_as(@user)
    get edit_team_path(@team)
    assert_template 'teams/edit'
    patch team_path(@team), team: {  teamname: "", teamcolor: "" }
    assert_template 'teams/edit'
  end

  test "successful team edit" do
  	log_in_as(@user)
    get edit_team_path(@team)
    assert_template 'teams/edit'
    patch team_path(@team), team: { teamname: "Blue Panthers", teamcolor: "blue" }
    assert_not flash.empty?
    assert_redirected_to team_path(@team)
    @team.reload
  end

  test "successful team edit with friendly forwarding" do
    get edit_team_path(@team)
    log_in_as(@user)
    assert_redirected_to edit_team_path(@team)
    patch team_path(@team), team: { teamname: "Blue Panthers", teamcolor: "blue"  }
    assert_not flash.empty?
    assert_redirected_to team_path(@team)
    @team.reload
  end

end
