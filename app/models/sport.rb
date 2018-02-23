class Sport < ApplicationRecord
 
        #ApplicationRecord was added in rails -v 5.0, so
        #ApplicationRecord::ActiveRecord::Base , it inherits from ActiveRecord which inherits from the Base class


	validates :sportname, presence: true, uniqueness: { case_sensitive: false }

	#retained with the possibility of switching from HABTM to has_many :through between sports and teams
    #has_many :teamsports         #, autosave: true
	#has_many :teams, :through => :teamsports
	has_and_belongs_to_many :teams, :dependent => :destroy, join_table: :teamsports

    #as_many :medals, inverse_of: :sport, :dependent => :destroy

    ##has_one :gold, :class_name => "Medal", :foreign_key => :gold_id
	has_one :gold  , inverse_of: :sport, :dependent => :destroy  #,   autosave: true    
	has_one :silver, autosave: true    #, inverse_of: :sport, :dependent => :destroy
	has_one :bronze, autosave: true    #, inverse_of: :sport, :dependent => :destroy

	accepts_nested_attributes_for :teams


	# Not needed as i'm not currently taking in any input from sport's form for medals' creation
	# which means i dont need "accepts_nested_attributes_for" for any of the medals.
	# Also, "accepts_nested_attributes_for" sets :autosave to true, by default.

	#retained with the possibility of switching from HABTM to has_many :through between sports and teams
    #accepts_nested_attributes_for :teamsports
    #accepts_nested_attributes_for :gold    #weirdly throws the error "undefined method create"

   
    after_create :build_default_medals

    #after_create :create_gold
    #before_create :build_default_medals      	
    #before_save :build_default_medals, on: :create   # Works perfectly well too
    # To create and associate medals before Sport is saved in the DB so that the medals are in the DB too.
    after_create :team_sport_association, on: :create
   

    def build_default_medals

    	self.create_gold  
    	self.create_silver
    	self.create_bronze

        ## If using :autosave
    	#self.build_gold(team: nil)
    	#self.build_silver(team: nil)
    	#self.build_bronze(team: nil)
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
