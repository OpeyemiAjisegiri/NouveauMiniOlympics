require 'test_helper'

class SportIndexTest < ActionDispatch::IntegrationTest

  def setup 
    @user = @admin = users(:michael)
   # @admin = users(:michael)
    @non_admin = users(:archer)
    @sport = sports(:one)
    @other_sport = sports(:three)
  end


  test "index as non-admin" do
    log_in_as(@non_admin)
    get sports_path
    assert_select 'a', text: 'delete', count: 0
  end
end
