class Team < ActiveRecord::Base

	validates :teamname, :teamcolor, presence: true
end
