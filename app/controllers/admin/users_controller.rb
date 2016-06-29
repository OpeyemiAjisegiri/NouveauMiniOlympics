class Admin::UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :select_team]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page]) 
  end
  
  def new
  	@user = User.new
    @profile = @user.build_profile
    ### Works just as would the after_create callback function
    ### due to user inputing data through the form
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Mini Olympics"
  		if @user.admin?
  		    redirect_to admin_user_profile_path(current_user)  
  	    else
  	    	redirect_to user_profile_path(current_user)
  	    end 
  	else
  		render 'new'
  	end
  end

  def show
    redirect_to user_profile_path(User.find(params[:id]))
    #@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "profile updated"
      if @user.admin?
  	    redirect_to admin_user_profile_path(current_user)  
  	  else
  	   	redirect_to user_profile_path(current_user)
  	  end 
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
 private

    def user_params
    	params.require(:user).permit(:id, :email, :admin, :password, :password_confirmation, profile_attributes: [:id, :name, 
    		:street, :city, :state, :zipcode] )
    end


   # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) 
      # current_user(@user)  = '@user == current_user'
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
