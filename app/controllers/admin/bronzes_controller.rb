class Admin::BronzesController < ApplicationController
    before_action :admin_user, only: [ :edit, :update]

	def show
	   @bronze = Sport.find(params[:sport_id]).bronze
	   # redirect_to admin_sport_path(Sport.find(params[:sport_id]))
	end

	def edit
	   @bronze = Sport.find(params[:sport_id]).bronze	
	end

	def update
		@bronze = Sport.find(paramsp[:sport_id]).bronze
		if @bronze.update_attributes(bronze_params)
			flash[:success] = "Bronze Assigned"
			redirect_to admin_sport_path(Sport.find(params[:sport_id]))
		else
            render 'edit'
		end
	end

	private

	  def bronze_params
		params.require(:bronze).permit(:id)
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
