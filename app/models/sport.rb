class Sport < ActiveRecord::Base


	validates :sportname, presence: true, 
	                         uniqueness: { case_sensitive: false }


	#retained with the possibility of switching from HABTM to has_many :through between sports and teams
    #has_many :teamsports         #, autosave: true
	#has_many :teams, :through => :teamsports
	has_and_belongs_to_many :teams, join_table: :teamsports

    has_one :medal, inverse_of: :sport
	has_one :gold
	has_one :silver
	has_one :bronze

	accepts_nested_attributes_for :teams
	####  MEDAL  ######
	accepts_nested_attributes_for :medal
	accepts_nested_attributes_for :gold
	accepts_nested_attributes_for :silver
	accepts_nested_attributes_for :bronze

	#retained with the possibility of switching from HABTM to has_many :through between sports and teams
    #accepts_nested_attributes_for :teamsports


    after_create :build_default_medal
	after_create :team_sport_association
	#after_save :team_sport_association
	#might have to switch the above line to 'after_create' as 
    #a new association with every  team is created with every save while using 'after_save'

    # I think it needs to be in the concern folder for the controller, 
    # as the first line in the function works when in the create function of sports controller 
    #but moving it to the model did work nor adding the finally line to save.
    #def team_sport_association
    #	self.teams<< teams
    #	self.teams.save
	#end

   
	def build_default_medal
		Medal.create(sport: self)

		#Medal.gold.create(sport: self)
		#Medal.silver.create(sport: self)
		#Medal.bronze.create(sport: self)
	end
    
	def team_sport_association
		#if self.save        #### not needed and causes an infinitely recursive loop 
		### that throws the error "Stack too Deep"		
				self.teams<< Team.all
				########  Could also be done by just adding the above line
				######## to the create action in the sports controller.
		#end
	end

end
