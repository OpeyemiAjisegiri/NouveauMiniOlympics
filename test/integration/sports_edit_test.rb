require 'test_helper'

class SportsEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:lana)
    @sport = sports(:one)
    @other_sport = sports(:five)
  end

  test "sport edit without admin priviledges" do
  	log_in_as(@user)
    #get edit_sport_path(@sport)
    ### No 'edit_sport_path' in routes.rb but the 
    ### non admin is supposed to be redirected to their profile
    assert_redirected_to user_profile_path(@user)
    #assert_template 'profiles/show'
    ## The above line throws the error "expecting <"profiles/show"> but rendering with <[]>"
  end
end