require 'test_helper'

class Admin::SportsControllerTest < ActionController::TestCase

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @sport = sports(:one)
    @team = teams(:warriors)
    @sport2 = Sport.new
    #@sport.gold = golds(:new)
    #@sport.silver = silvers(:lat)
    #@sport.bronze = bronzes(:bran)
  end

  test "should get new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should get show" do 
    log_in_as(@user)
    get :show, id: @sport
    assert_response :success
  end

  test "should get index" do
    log_in_as(@user)
    get :index 
    assert_response :success 
  end

  test "should get medals" do 
    log_in_as(@user)
    get :medals, id: @sport
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get :index  
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect new when not logged in " do
    get :new
    assert_redirected_to login_url
  end

    test "should redirect medals when not logged in" do
    get :medals, id: @sport
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect assign_medal when not logged in " do
    get :assign_medal, id: @sport
    assert_redirected_to login_url
  end

  test "should redirect new when not logged in as admin" do 
    log_in_as(@other_user)
    get :new
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect medals when not logged in as admin" do 
    log_in_as(@other_user)
    get :medals, id: @sport
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect create when not logged in as admin user" do
    log_in_as(@other_user)
    get :create, id: @sport, sport: {sportname: "Football"}
    # Commented out the flash[:danger] in admin_user function in the test controller
    # which led to 'assert' replacing 'assert_not'
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end


  test "should redirect edit when not logged in as admin user" do
    log_in_as(@other_user)
    get :edit, id: @sport,sport: {sportname: "Soccer"}
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect update when not logged in as admin user" do
    log_in_as(@other_user)
    patch :update, id: @sport, sport: {sportname: "50M Race"}
    # Commented out the flash[:danger] in admin_user function in the test controller
    #assert_not flash.empty?
    assert flash.empty?
    assert_redirected_to user_profile_path(@other_user)
  end

  test "should redirect create when not logged in" do
    get :create, id: @sport
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @sport
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @sport
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Sport.count' do
      delete :destroy, id: @sport
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Sport.count' do
      delete :destroy, id: @sport
    end
    assert_redirected_to user_profile_path(@other_user)
  end

  test "associated gold medal should be created" do
    assert_difference 'Gold.count', 1 do
      log_in_as(@user)
      #@sport2.build_gold(team: nil)
      #get :create, id: @sport2, sport: {sportname: "Frisbee"}
      ##post admin_sports_path(@sport2), sport: {sportname: "Testing Sport"}    #--> Error: No route matches {:action=>"/admin/sports", :controller=>"admin/sports",
      ###### FROM RAILS SERVER, and it works ##### 
      ## Started POST "/admin/sports" for 127.0.0.1 at 2016-07-23 18:53:01 -0400, Processing by Admin::SportsController#create as HTML
      ##Parameters: {"utf8"=>"√", "authenticity_token"=>"+nzArGG1v76UgkpkC36A9RtwWWJmwKwtucfL2iS3bdg=", "sport"=>{"sportname"=>"Badminton"}, "commit"=>"Create Sport"}
      #assert_redirected_to admin_sports_path(@sport2), sport: {sportname: "Testing Sport"}
      
      ### Not accounting for the callback to create the gold medal but it currently works
      get :create, sport: {sportname: "Frisbee"}
      assert_not flash.empty?
    end
  end

  test "associated silver medal should be created" do
    assert_difference 'Silver.count', 1 do
      log_in_as(@user)
      #@sport2.build_silver(team: nil)
      #get :create, id: @sport2, sport: {sportname: "Frisbee"}
      ##post admin_sports_path(@sport2), sport: {sportname: "Testing Sport"}    #--> Error: No route matches {:action=>"/admin/sports", :controller=>"admin/sports"
      #assert_redirected_to admin_sports_path(@2sport), sport: {sportname: "Testing Sport"}
      
      ### Not accounting for the callback to create the silver medal but it currently works
      get :create, sport: {sportname: "Frisbee"}
      assert_not flash.empty?
    end
  end

  test "associated bronze medal should be created" do
    assert_difference 'Bronze.count', 1 do
      log_in_as(@user)
      #@sport2.build_bronze(team: nil)
      #get :create, id: @sport2, sport: {sportname: "Frisbee"}
      ##post admin_sports_path(@sport2), sport: {sportname: "Testing Sport"}    #--> Error: No route matches {:action=>"/admin/sports", :controller=>"admin/sports"
      #assert_redirected_to admin_sports_path(@sport2), sport: {sportname: "Testing Sport"}
      
      ### Not accounting for the callback to create the bronze medal but it currently works
      get :create, sport: {sportname: "Frisbee"}
      assert_not flash.empty?
    end
  end

  test "associated gold should be destroyed" do
    #@sport.gold = @gold
    @sport.save
    assert_difference 'golds.count', 0 do
      @sport.destroy
    end
  end

  test "associated silver should be destroyed" do
    #@sport.silver = @silver
    @sport.save
    assert_difference 'silvers.count', 0 do
      @sport.destroy
    end
  end

  test "associated bronze should be destroyed" do
    #@sport.bronze = @bronze
    @sport.save 
    assert_difference 'bronzes.count', 0 do
      @sport.destroy
    end
  end
end
