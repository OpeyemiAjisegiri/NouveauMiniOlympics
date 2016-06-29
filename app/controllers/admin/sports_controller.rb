class Admin::SportsController < ApplicationController
  #include TeamSportAssociation

  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :logged_in_user, only: [ :index]
  
  def new
  	@sport  = Sport.new
   # @medal = @sport.build_medal   
    ### The line @medal = @sport.build_medal is currently working as
    ### i'm using a hidden field in the sport new
    ### form but i could also do the call back for security reasons 
    ### (due to user input and possible accesibility), any user can see it by just right clicking 
    ### and checking for the page source (major security issue) but having issues using that with seeding the DB.
    ### The after_create callback creates another column for the sport filled with nill
    ### after persisting the data I want seeding for the sport's medal.
    ### Also, when  I change to the callback function, i need to take off the medal attributes 
    ### off the whitelisted sport attributes in the permit function.
  end

  def create
  	@sport = Sport.new(sport_params)
    #@sport.teams<< Team.all
    ########  Could also be done by just adding the above line
    ######## to a callback method in the sports model.
    if @sport.save
      flash[:success] = "Sport created."
      ## The line below works but i prolly need to move or switch it depending on if
      ## i need / want the association to be created
      ## when a user registers to play the sport or when both the sport and teams are created.
      ## @sport.teams<< current_user.team     #@teams# @team.all 
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
  	  #redirect_to @sport
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
    	params.require(:sport).permit(:id, :sportname, medal_attributes: [:id])   
      #, :sport_id, :gold_id, :silver_id, :bronze_id])  
      ### Foreign keyshould never be whitelisted and avalable for editting!!!!!
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
    end
end
