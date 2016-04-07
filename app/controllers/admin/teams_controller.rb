class Admin::TeamsController < ApplicationController

  before_action :admin_user,     only: [:new, :create, :edit, :update, :destroy]
  #before_action :logged_in_user, only: [ :index]

  def new
  	@team = Team.new
  end

  def create
    @team = Team.new(team_params)
    #@team.captain = current_user
    #@team.sports<< Sport.all
    ########  Could also be done by just adding the above line
    ######## to a callback method in the teams model.
    if @team.save
      current_user.update_attribute(:captain_id, @team.id)
      current_user.update_attribute(:team_id, @team.id)
      flash[:success] = "Team created."
      redirect_to admin_team_path(@team)
    else
      flash[:error_messages]
      render 'new'
    end
  end

  def show
  	#@team = Team.find(id: params[:id])
  	@team = Team.find(params[:id])
    @teams = @team.users.paginate(page: params[:page])
  end

  def edit
  	@team = Team.find(params[:id])
  end

  def index
  	@teams = Team.paginate(page: params[:page])
  end

  def update
  	  @team = Team.find(params[:id]) 
  	  if @team.update_attributes(team_params)
  		flash[:success] = "Team updated"
  		redirect_to admin_team_path(@team)
      #redirect_to @team
  	  else
  		render 'edit'
  	  end
  end

  def destroy
  	Team.find(params[:id]).destroy
  	flash[:success] = "Team deleted"
  	redirect_to teams_url
  end

  private

    def team_params
    	params.require(:team).permit(:id, :teamname, :teamcolor )
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
        #flash[:danger] = "Sorry, you don't have the authority to do that."
        redirect_to(user_profile_path(current_user)) unless current_user.admin?
      end
     #The line below only works when current_user == nil, i.e. no-one is logged in
     # redirect_to(user_profile_path(current_user)) unless current_user.admin? if logged_in? else redirect_to login_url 
    end

end
