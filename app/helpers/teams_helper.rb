module TeamsHelper

	def captain_name(user)
	   if @team.captain == nil 
	   	name = "TBD"
	   else
	   	@team.captain.profile.name  
	   end
	 #  name = "TBD" unless (@team.captain != nil)
	 # else 
	 # 	name == @team.captain.profile.name
	 #  end
	end

	#def team_captain(user)
    #	captain = @team.captain
	#end
end
