class Admin::MedalsController < ApplicationController
	before_action :admin_user, only: [ :edit, :update]
    #before_action :logged_in_user, only: [ :index]

    #### Have to find a way of redirecting routing paths like "~/admin/teams/:team_id/medal/edit" 
    #### from hitting controller and throwing an error.

  def show
    redirect_to admin_sport_path(Sport.find(params[:sport_id]))
  end

  def edit
  	@medal = Sport.find(params[:sport_id]).medal
    ## "Sport.find(params[:sport_id]).medal"   is the same as using "Medal.find(params[:sport_id])"
  end

  def update
    @medal = Sport.find(params[:sport_id]).medal
  	#@medal = Medal.find(params[:id]) 
    # Throws an error as it's trying to locate the medal using medal's id which isn't provided in the url
    #@medal.update_attribute(:gold_id,   @medal.gold_id)
    #@medal.update_attribute(:silver_id, @medal.silver_id)
    #@medal.update_attribute(:bronze_id, @medal.bronze_id)
    if @medal.update_attributes(medal_params)

   	  flash[:success] = "Medal Assigned"
  	  redirect_to admin_sport_path(Sport.find(params[:sport_id]))
      #redirect_to admin_sport_medal_path(@sport)
  	else
  	  render 'edit'
  	end 
  end

  private

    def medal_params
    	params.require(:medal).permit(:id, :gold_id, :silver_id, :bronze_id)
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
