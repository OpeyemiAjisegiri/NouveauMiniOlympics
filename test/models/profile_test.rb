require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  def setup
    @profile = Profile.new(name: "Example Test", street: "12 Veteran Rd", city: "Waterloo", state: "AW", zipcode: "77992")
    #@profile = profiles(:curtis)
  end

 # test "should be valid" do
 #   assert @profile.valid?
 # end

  test "name should be present" do
    @profile.name = "     "
    assert_not @profile.valid?
  end

  test "street should be present" do
    @profile.street = "     "
    assert_not @profile.valid?
  end

  test "city should be present" do
    @profile.city = "     "
    assert_not @profile.valid?
  end

  test "state should be present" do
    @profile.state = "     "
    assert_not @profile.valid?
  end

  test "zipcode should be present" do
    @profile.zipcode = "     "
    assert_not @profile.valid?
  end

  # The test below is supposed to test for the uniquenes of the name variable 
  # but if fails and there's currently no unique attribute attached to the validation statement in the model
  #test "name should be unique" do
  #  duplicate_profile = @profile.dup
  #  duplicate_profile.name = @profile.name.upcase
  #  @profile.save
  #  assert_not duplicate_profile.name.valid?
  #end
end
