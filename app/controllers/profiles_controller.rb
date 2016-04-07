class ProfilesController < ApplicationController
	before_action :correct_profile, only: [:edit, :update]
  #before_action :logged_in_user,  only: [:edit, :update]
   
#   def create
#   	@user = User.find(params[:user_id])
#   	@profile = User.profile.create(profile_params)
#   	redirect_to user_path(@user)
#   end

	def edit
		#@profile = User.find(params[:user_id]).profile
	end

	def show
    @profile = User.find(params[:user_id]).profile
		#'User.find(params[:user_id]).profile' is the same as 'Profile.find(params[:user_id])'
    # due to the db relationship
	end

	def update
	    #@profile = User.find(params[:user_id]).profile 
        if @profile.update_attributes(profile_params)
          flash[:success] = "profile updated"
          if current_user.admin?
            redirect_to admin_user_profile_path(current_user)
          else
            redirect_to user_profile_path(current_user)
          # Not using 'user_profile_path(@user)' because i'm not using the profile.id to 
          # search for the profile, but rather the foreign key 'user_id'; making the '@profile' redundant.
          end
        else
          render 'edit'
        end
    end



	 private

    def profile_params
    	params.require(:profile).permit(:id, :name, :street, :city, :state, :zipcode)
    end

    # Confirms a logged-in user.
    #def logged_in_user
    #  unless logged_in?
    #  	store_location
    #    flash[:danger] = "Please log in."
    #    redirect_to login_url
    #  end
    #end

    def correct_profile
      @profile = User.find(params[:user_id]).profile
      redirect_to user_profile_path(current_user) unless current_profile?(@profile)     # '@profile.user_id == current_user.id' = 'current_profile?(@profile)'
      #Also the line "redirect_to current_user unless current_profile?(@profile)" goes to the intended destination bu tjumps a lot of hoops through redirect;
      #changing "redirect_to current_user" to "redirect_to user_profile_path(current_user)" reduced the redirecting over-head.
    end

end
