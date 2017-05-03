require 'test_helper'
 
class Admin::GoldsEditTest < ActionDispatch::IntegrationTest
	def setup
	  @user = users(:michael)
    @other_user = users(:archer)
    @sport = sports(:one)
    @sport.gold = @gold = golds(:one)
    @team = teams(:bears)
    @team2 = teams(:panthers)
    @team3 = teams(:angels)
	end

#	  test "should redirect edit when not logged in as admin user" do
#    log_in_as(@other_user)
#    get medals_admin_sport_path(@sport)
#    assert flash.empty?
#    assert_redirected_to user_profile_path(@other_user)
#  end

#  test "should redirect update when not logged in as admin user" do
#    log_in_as(@other_user)
#    #patch admin_sport_gold_path(@sport)
#    patch assign_medal_admin_sport_path(@sport)
#  #  #assert_not flash.empty?
#    assert flash.empty?
#    assert_redirected_to user_profile_path(@other_user)
#  end

#  test "should redirect edit when not logged in" do
#  	get medals_admin_sport_path(@sport)
#    #get edit_admin_sport_gold_path(@sport)
#    assert_not flash.empty?
#    assert_redirected_to login_url
#  end

#  test "should redirect update when not logged in" do
#    #patch admin_sport_gold_path(@sport)
#    patch assign_medal_admin_sport_path(@sport)
#    assert_not flash.empty?
#    assert_redirected_to login_url
#  end

#### Don't really know how to test if it fails i.e no teams where picked as the app just raises the error "can't find team withou id"
  #test "unsuccessful gold assigning as an admin" do
  #	log_in_as(@user)
  #  get medals_admin_sport_path(@sport)
  #	#get assign_medal_admin_sport_path(@sport)
  #  assert_template 'admin/sports/medals'
  #  patch assign_medal_admin_sport_path(@sport), sport: {gold: {team: ""}}
  #  #debugger
  #  assert_template 'admin/sports/assign_medal'
  #end




  #### NOT SURE IF THIS SHULD BE TESTED AND HOW, CURRENTLY GETTING "NO METHOD ERROR: Undefined method '[]' for nil:nil class"
  #test "successful gold assigning as an admin" do
    #log_in_as(@user)#
    #get medals_admin_sport_path(@sport)#
    
    ###get edit_admin_sport_gold_path(@sport)
    
    #assert_template 'admin/sports/medals'#    
    
    ###patch assign_medal_admin_sport_path(@sport, @gold), sport: {:gold => {[:team] => @team} }  #, :silver => {[:team] => @team3}, :bronze => {[:team] => @team2}}  #ERROR: Couldn't find find team without an ID #, [:silver][:team_id] => @team3.id, [:bronze][:team_id] => @team2.id}
    
    #patch assign_medal_admin_sport_path(@sport, @gold), golds(:one).team => @team
    
    ###### ERROR: TypeError: no implicit conversion of Symbol into Integer ####
    ###, sport: {[:gold][:team_id] => @team.id, [:silver][:team_id] => @team3.id, [:bronze][:team_id] => @team2.id}
    ###{:sport[:gold][:team_id] => @team.id, :sport[:silver][:team_id] => @team3.id, :sport[:bronze][:team_id] => @team2.id}
    

    ##### ERROR: NoMethodError: undefined method `[]' for nil:NilClass #####
    #, {@sport[:gold][:team_id] => @team.id, @sport[:silver][:team_id] => @team3.id, @sport[:bronze][:team_id] => @team2.id}
    #, sport: {[[:gold, :team], [:silver, :team], [:bronze, :team]] => [@team3, @team, @team2]}
    #, :sport => {[:gold, :silver, :bronze] => [{team: @team3},{team: @team},{team: @team2}]}
    #, sport: {(gold: {team_id: @team.id}),(silver: {team_id: @team3.id}),(:bronze => {team_id: @team2.id}) }
    
    #assert flash.empty?#
    #assert_redirected_to admin_sport_path(@sport)#
    #@sport.reload#
  #end#
end