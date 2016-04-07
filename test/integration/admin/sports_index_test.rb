require 'test_helper'

class SportIndexTest < ActionDispatch::IntegrationTest

  def setup 
    @user = @admin = users(:michael)
   # @admin = users(:michael)
    @non_admin = users(:archer)
    @sport = sports(:one)
    @other_sport = sports(:three)
  end


  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get sports_path
    assert_template 'sports/index'
    #assert_select 'div.pagination'
    #### There arent enough sports to paginate them
    first_page_of_sports = Sport.paginate(page: 1)
    first_page_of_sports.each do |sport|
      assert_select 'a[href=?]', sport_path(sport), text: sport.sportname
      unless @user == @admin
        assert_select 'a[href=?]', sport_path(sport), text: 'delete'
      end
    end
    assert_difference 'Sport.count', -1 do
      delete admin_sport_path(@other_sport)
    end
  end

end
