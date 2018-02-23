class Teamsport < ApplicationRecord
 
        #ApplicationRecord was added in rails -v 5.0, so
        #ApplicationRecord::ActiveRecord::Base , it inherits from ActiveRecord which inherits from the Base class



    #retained with the possibility of switching from HABTM to has_many :through between sports and teams
	belongs_to :team
	belongs_to :sport
end
