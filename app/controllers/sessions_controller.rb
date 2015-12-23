class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    ### The above code works but the one below uses the instance variable i.e. self
    ### but "?user" throws errors into my test that i dont know how to solve yet
    #?user = User.find_by(email: params[:session][:email].downcase)
    #if ?user && ?user.authenticate(params[:session][:password])
    #  log_in ?user
    #  params[:session][:remember_me] == '1' ? remember(?user) : forget(?user)
    #  redirect_to ?user
  		#redirect_back_or user
      if current_user.admin?
        redirect_back_or admin_user_profile_path(user)
      else
        redirect_back_or user_profile_path(user)
      end
  	else 
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
