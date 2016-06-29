require 'test_helper'

class Admin::MedalsControllerTest < ActionController::TestCase
  
  def setup
   @user = users(:michael)
   @other_user = users(:archer)
   @sport = sports(:one)
   @medal = medals(:one)
  end


end
