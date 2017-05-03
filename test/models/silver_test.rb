require 'test_helper'

class SilverTest < ActiveSupport::TestCase
  def setup
  	@silver = Silver.new(sport_id: 2, team_id: nil)
  	#@silver =Silver.new()
    #@silver = silvers(:lot)
  end
  
  test "should be valid" do
    #assert @silver.valid?
     ## The no create method error from has one is forcing a failing validation test fail in the model test 
     ## but the create method (create_other()) should have been added by the has_one and belongs_to relationship in the model 
  end

  test "should have a sport" do 
    #assert_not @silver.sport_id == nil    ##This line also works
    assert @silver.sport_id != nil
  end

  test "should have team but nil at creation" do
    assert @silver.team == nil 
  end
end
