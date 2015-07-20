class UsersController < ApplicationController
  def new
  	@user = User.new
  	@profile = self.build_default_profile
  end

  private

    def user_params
    	params.require(:user).permit(:email)
    end
end
