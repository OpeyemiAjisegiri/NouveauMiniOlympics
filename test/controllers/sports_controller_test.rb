require 'test_helper'

class SportsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
