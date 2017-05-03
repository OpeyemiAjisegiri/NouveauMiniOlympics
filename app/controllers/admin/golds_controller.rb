class Admin::GoldsController < ApplicationController
    before_action :admin_user, only: [ :edit, :update]

    def new
      @sport = Sport.find(params[:sport_id])
      @gold = @sport.build_gold
    end

    def create
      @sport = Sport.find(params[:sport_id])
      @gold = @sport.create_gold(team: nil)
    end

	def show
	   @gold = Sport.find(params[:sport_id]).gold
	   # redirect_to admin_sport_path(Sport.find(params[:sport_id]))
	end


	def edit
	   @gold = Sport.find(params[:sport_id]).gold	
	end

	def update
		@gold = Sport.find(paramsp[:sport_id]).gold
		if @gold.update_attributes(gold_params)
			flash[:success] = "Gold Assigned"
			redirect_to admin_sport_path(Sport.find(params[:sport_id]))
		else
            render 'edit'
		end
	end

	private

	  def gold_params
		params.require(:gold).permit(:id)
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
