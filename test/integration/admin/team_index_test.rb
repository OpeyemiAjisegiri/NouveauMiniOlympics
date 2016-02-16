require 'test_helper'

class TeamIndexTest < ActionDispatch::IntegrationTest

  def setup 
    @user = @admin = users(:michael)
   # @admin = users(:michael)
    @non_admin = users(:archer)
    @team = teams(:bears)
    @other_team = teams(:panthers)
  end


  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get teams_path
    assert_template 'teams/index'
    assert_select 'div.pagination'
    first_page_of_teams = Team.paginate(page: 1)
    first_page_of_teams.each do |team|
      assert_select 'a[href=?]', team_path(team), text: team.teamname
      unless @user == @admin
        assert_select 'a[href=?]', team_path(team), text: 'delete'
      end
    end
    assert_difference 'Team.count', -1 do
      delete team_path(@other_team)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get teams_path
    assert_select 'a', text: 'delete', count: 0
  end
end
