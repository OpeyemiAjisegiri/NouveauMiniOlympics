class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy


  def new
  	@user = User.new
   # @profile = @user.profile
    @profile = @user.build_profile
    # The above line worked just as the below line
    # but when the 'build_default_profile' is defined in the user model
    # it restricts the values passed into the profile's database table 
    # though it works perfectly well in rails 3, 
    # also there was a weird mis-coloration in the form (blue -> user attributes and red -> profile attributes).. 
    # The 'build_profile' is a default rails method for has_one association 'build_association'
  	#@profile = @user.build_default_profile
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Mini Olympics"
  		redirect_to user_profile_path(current_user)  
      # Not using 'user_profile_path(@user)' because i'm not using the profile.id to 
      # search for the profile, but rather the foreign key 'user_id'; making the '@profile' redundant.
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    # Commented out the code, as its redundant due to the line 'before_action :correct_user'
    # @user = User.find(params[:id])
  end

  def update
    # Commented out  first line of the code, as its redundant due to the line 'before_action :correct_user'
    # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "profile updated"
      #redirect_to @user
      redirect_to user_profile_path(current_user, @profile)
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
    	params.require(:user).permit(:id, :email, :password, :password_confirmation, profile_attributes: [:id, :name, 
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
      redirect_to(root_url) unless current_user?(@user)   # '@user == current_user' = 'current_user?(@user)'
    end

    # Confirms an admin user. 
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
