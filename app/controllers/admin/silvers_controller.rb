class Admin::SilversController < ApplicationController
    before_action :admin_user, only: [ :edit, :update]

	def show
	   @silver = Sport.find(params[:sport_id]).silver
	   # redirect_to admin_sport_path(Sport.find(params[:sport_id]))
	end

	def edit
	   @silver = Sport.find(params[:sport_id]).silver	
	end

	def update
		@silver = Sport.find(paramsp[:sport_id]).silver
		if @silver.update_attributes(silver_params)
			flash[:success] = "Silver Assigned"
			redirect_to admin_sport_path(Sport.find(params[:sport_id]))
		else
            render 'edit'
		end
	end

	private

	  def silver_params
		params.require(:silver).permit(:id)
	  end

	  # Confirms a logged-in user.
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end

      # Confirms an admin user.
      def admin_user
        unless logged_in?
         store_location
         flash[:danger] = "Please log in."
         redirect_to login_url  
        else
          redirect_to(user_profile_path(current_user)) unless current_user.admin?
        end
      end
end
