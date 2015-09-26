require 'test_helper'

class TeamTest < ActiveSupport::TestCase

	def setup
		@team = Team.new(teamname: "Golden Bears", teamcolor: "gold")
 	end
  
    test "should be valid" do
     assert @team.valid?
    end

    test "teamname should be present" do
      @team.teamname = "     "
      assert_not @team.valid?
    end

    test "teamcolor should be present" do
      @team.teamcolor = "     "
      assert_not @team.valid?
    end
end
