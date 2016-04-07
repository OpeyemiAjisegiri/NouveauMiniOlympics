class SportsController < ApplicationController

  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :logged_in_user, only: [ :index]
  
  def new
  	@sport  = Sport.new
  end

  def create
  	@sport = Sport.new(sport_params)
    if @sport.save
      #current_user.update_attribute(:team_id, @team.id)
      flash[:success] = "Sport created."
      redirect_to @sport
    else
      flash[:error_messages]
      render 'new'
    end
  end

  def show
    if (params[:id]) == "new"
      redirect_to user_profile_path(current_user)
    else
  	  @sport = Sport.find(params[:id])
    end
    #@sport = @sport.teams.paginate(page: params[:page])   
    #@sport = @sport.users.paginate(page: params[:page])
  end

  def index
  	@sports = Sport.paginate(page: params[:page])
  end

  def edit
    @sport = Sport.find(params[:id])  	
  end

  def update
    @sport = Sport.find(params[:id]) 
    if @sport.update_attributes(sport_params)
   	  flash[:success] = "Sport updated"
  	  redirect_to @sport
  	else
  	  render 'edit'
  	end 	
  end

  def destroy
  	Sport.find(params[:id]).destroy
  	flash[:success] = "Sport deleted"
  	redirect_to sports_url  	
  end

  private

    def sport_params
    	params.require(:sport).permit(:id, :sportname)
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
       # store_location
       # flash[:danger] = "Please log in."
       # redirect_to login_url  
      #else
        redirect_to(user_profile_path(current_user)) unless current_user.admin?
      end
    end
  
end