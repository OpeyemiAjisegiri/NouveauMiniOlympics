require 'test_helper'

class TeamIndexTest < ActionDispatch::IntegrationTest

  def setup 
    @user = @admin = users(:michael)
   # @admin = users(:michael)
    @non_admin = users(:archer)
    @team = teams(:bears)
    @other_team = teams(:panthers)
  end


  test "index as non-admin" do
    log_in_as(@non_admin)
    get teams_path
    assert_select 'a', text: 'delete', count: 0
  end
end
