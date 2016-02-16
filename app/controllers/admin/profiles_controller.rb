class Admin::ProfilesController < ApplicationController
	before_action :correct_profile, only: [:edit, :update]

	def edit
		#@profile = User.find(params[:user_id]).profile
	end

	def show
		@profile = User.find(params[:user_id]).profile 
		#'User.find(params[:user_id]).profile' is the same as 'Profile.find(params[:user_id])'
	end

	def update
	    #@profile = User.find(params[:user_id]).profile 
        if @profile.update_attributes(profile_params)
          flash[:success] = "profile updated"
          if current_user.admin?
  		    redirect_to admin_user_profile_path(current_user)  
  	      else
  	    	redirect_to user_profile_path(current_user)
  	      end
        else
          render 'edit'
        end
    end



	 private

    def profile_params
    	params.require(:profile).permit(:id, :name, :street, :city, :state, :zipcode)
    end

    def correct_profile
      @profile = User.find(params[:user_id]).profile
      redirect_to(root_url) unless current_profile?(@profile)     # '@profile.user_id == current_user.id' = 'current_profile?(@profile)'
    end
end
