class Sport < ActiveRecord::Base

	after_save :team_sport_association

	validates :sportname, presence: true, 
	                         uniqueness: { case_sensitive: false }

    has_many :teamsports         #, autosave: true
	has_many :teams, :through => :teamsports

	accepts_nested_attributes_for :teamsports
	accepts_nested_attributes_for :teams

    # I think it needs to be in the concern folder for the controller, 
    # as the first line in the function works when in the create function of sports controller 
    #but moving it to the model did work nor adding the finally line to save.
    #def team_sport_association
    #	self.teams<< teams
    #	self.teams.save
	#end

	def team_sport_association
		#if self.save        #### not needed and causes an infinitely recursive loop 
		### that throws the error "Stack too Deep"		
				self.teams<< Team.all
				########  Could also be done by just adding the above line
				######## to the create action in the sports controller.
		#end
	end

end
