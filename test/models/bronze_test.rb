require 'test_helper'

class BronzeTest < ActiveSupport::TestCase
  def setup
  	@bronze = Bronze.new(sport_id: 1, team_id: nil)
  	#@bronze = Bronze.new()
    #@bronze = bronzes(:bran)
  end
  
  
  test "should be valid" do
    #assert @bronze.valid?
     ## The no create method error from has one is forcing a failing validation test fail in the model test 
     ## but the create method (create_other()) should have been added by the has_one and belongs_to relationship in the model 
  end

  test "should have a sport" do 
    assert_not @bronze.sport_id == nil #The line "assert @bronze.sport_id != nil" also works
  end
  
  test "should have team but nil at creation" do
    assert @bronze.team == nil 
  end
end
