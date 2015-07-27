class UsersController < ApplicationController
  def new
  	@user = User.new
  	#@profile = self.build_default_profile
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Mini Olympics"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private

    def user_params
    	params.require(:user).permit(:id, :email, :password, :password_confirmation, profile_attributes: [:name, 
    		:address, :sex] )
    end
end
