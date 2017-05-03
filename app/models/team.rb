class Team < ActiveRecord::Base
 
	validates :teamname, :teamcolor, presence: true,  uniqueness: { case_sensitive: false }
	  
	#has_many :profiles, through: :users
	has_one  :captain, :class_name => "User", :foreign_key => :captain_id
	#, :through => :user
	has_many :users     #, inverse_of: :teams
	has_many :golds     #, inverse_of: :team, :dependent => :destroy
	has_many :silvers   #, inverse_of: :team, :dependent => :destroy
	has_many :bronzes   #, inverse_of: :team, :dependent => :destroy
 
    #retained with the possibility of switching from HABTM to has_many :through between sports and teams
	#has_many :teamsports             #, autosave: true
	#has_many :sports, :through => :teamsports
    has_and_belongs_to_many :sports, :dependent => :destroy, join_table: :teamsports

    #after_save :set_default_captain
    after_create :team_sport_association
   


    accepts_nested_attributes_for :users
	#accepts_nested_attributes_for :profiles
	accepts_nested_attributes_for :captain
	accepts_nested_attributes_for :sports


	#retained with the possibility of switching from HABTM to has_many :through between sports and teams
	#accepts_nested_attributes_for :teamsports




	#def set_default_captain
	# if captain_id.changed?
    #   profiles.each do |user|
    #     user.captain = captain
    #     user.save
    #   end
    # end
	#end


	def team_sport_association
		#if self.save        #### not needed and causes an infinitely recursive loop 
		### that throws the error "Stack too Deep"		
				self.sports<< Sport.all
				########  Could also be done by just adding the above line
				######## to the create action in the sports controller.
		#end
	end
end
