require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @admin = users(:michael)
    @non_admin = users(:archer)
   @profile = @user.build_profile( name: "Micheal Example", street: "24 Martins St.", city: "Waterloo", state: "AW", zipcode: "22456")
  end

#The other users_login_test.rb in the integration folder also test for the admin user..
end
