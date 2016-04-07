require 'test_helper'

class SportTest < ActiveSupport::TestCase
	def setup
		#@sport = Sport.new(sportname: "!00M Relay")
		@sport = sports(:one)
 	end
  
  test "should be valid" do
    assert @sport.valid?
  end

   test "sportname should be present" do
    @sport.sportname = "     "
    assert_not @sport.valid?
  end
end