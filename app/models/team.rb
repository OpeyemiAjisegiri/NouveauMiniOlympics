class Team < ActiveRecord::Base
 
	validates :teamname, :teamcolor, presence: true,  uniqueness: { case_sensitive: false }
	  
	#has_many :profiles, through: :users
	has_one  :captain, :class_name => "User", :foreign_key => :captain_id
	#, :through => :user
	has_many :users     #, inverse_of: :teams

	has_many :teamsports             #, autosave: true
	has_many :sports, :through => :teamsports


    #after_save :set_default_captain
    after_save :team_sport_association
   
    accepts_nested_attributes_for :users
	#accepts_nested_attributes_for :profiles
	accepts_nested_attributes_for :captain
	accepts_nested_attributes_for :teamsports
	accepts_nested_attributes_for :sports

	"def set_default_captain
	 if captain_id.changed?
       profiles.each do |user|
         user.captain = captain
         user.save
       end
     end
	end"


	def team_sport_association
		#if self.save        #### not needed and causes an infinitely recursive loop 
		### that throws the error "Stack too Deep"		
				self.sports<< Sport.all
				########  Could also be done by just adding the above line
				######## to the create action in the sports controller.
		#end
	end
end
