class UsersController < ApplicationController
  def new
  end

  private

    def user_params
    	params.require(:user).permit(:email)
    end
end
