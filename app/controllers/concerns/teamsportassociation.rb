module TeamSportAssociation
	extend ActiveSupport::Concern

	module ClassMethod
	end

	def saveassociation(team)
		sports.teams<< current_user.team			
	end

end
