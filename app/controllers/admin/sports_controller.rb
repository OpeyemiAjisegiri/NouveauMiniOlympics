class Admin::SportsController < ApplicationController
  #include TeamSportAssociation

  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :medals, :assign_medal]
  before_action :logged_in_user, only: [ :index]
  
  def new
  	@sport  = Sport.new
    #@gold = @sport.build_gold
  end

  def create
  	@sport = Sport.new(sport_params)
    if @sport.save!
      #@gold = @sport.medals.gold.create(team: nil)
      #@sport.gold = @sport.create_gold(team: nil)
      flash[:success] = "Sport created."
      redirect_to admin_sport_path(@sport)
    else
      flash[:error_messages]
      render 'new'
    end
  end

  def show
  	@sport = Sport.find(params[:id])
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
      redirect_to admin_sport_path(@sport)
  	else
  	  render 'edit'
  	end 	
  end

  def destroy
  	Sport.find(params[:id]).destroy
  	flash[:success] = "Sport deleted"
  	redirect_to sports_url  	
  end

  def medals
    @sport = Sport.find(params[:id]) 
    #redirect_to assign_medal_admin_sport_path(@sport)
  end

  def assign_medal
   
    ###Sport.find(params[:id]).gold.update_attribute(:team, Team.find(params[:sport][:gold][:team]))   # asigns the foreign key and updates the team's gold counter twice.

     
    @sport = Sport.find(params[:id])
    @sport.gold.update_attributes(team_id: Team.find(params[:sport][:gold][:team]).id)
    @sport.silver.update_attributes(team_id: Team.find(params[:sport][:silver][:team]).id)
    @sport.bronze.update_attributes(team_id: Team.find(params[:sport][:bronze][:team]).id)
          
    redirect_to admin_sport_path(Sport.find(params[:id]))
  end

  private

    def sport_params
    	params.require(:sport).permit(:id, :sportname)        
            # Not accepting any input from forms on medal creation through sports  
    end

    #def sportMedal_params
    #  params.require(:sport).permit({gold: [:team]})
    #end

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
    end
end
