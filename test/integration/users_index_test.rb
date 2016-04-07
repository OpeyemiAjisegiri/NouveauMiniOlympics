require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  #fixtures :all

  def setup
    @user = users(:michael)
    @admin = users(:michael)
    @non_admin = users(:archer)
   @profile = @user.build_profile( name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456")
  end


  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1, per_page: 15)
    first_page_of_users.each do |user|
      #assert_select 'a[href=?]', user_path(user), text: user.profile.name
      assert_select 'a[href=?]', user_path(user), text: user.email
      unless user = @admin  
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
