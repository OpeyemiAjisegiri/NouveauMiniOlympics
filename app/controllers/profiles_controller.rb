class ProfilesController < ApplicationController
	def edit
		@profile = Profile.find(params[:id])
	end

	def show
		@user.profile = user.find(params[:id]).profile
	end

	def destroy
		
	end
end
