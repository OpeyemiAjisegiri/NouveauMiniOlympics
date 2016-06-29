class Teamsport < ActiveRecord::Base
    #retained with the possibility of switching from HABTM to has_many :through between sports and teams
	belongs_to :team
	belongs_to :sport
end
