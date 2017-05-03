module TeamsHelper

	def captain_name(user)
	   if @team.captain == nil 
	   	name = "TBD"
	   	#return "TBD"
	   else
	   	@team.captain.profile.name  
	   end
	 # name = "TBD" unless (@team.captain != nil) 
	 # /* shows "TBD" when "@team.captain == nil" but else doesn't show @team.captain.name */
	 # else 
	 # 	name == @team.captain.profile.name
	 #  end
	end
end
