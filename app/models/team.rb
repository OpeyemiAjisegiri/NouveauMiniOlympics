class Team < ActiveRecord::Base
 
	validates :teamname, :teamcolor, presence: true
	  
	#has_many :profiles, through: :users
	has_one  :captain, :class_name => "User", :foreign_key => :captain_id
	#, :through => :user
	has_many :users


    #after_save :set_default_captain
   
    accepts_nested_attributes_for :users
	#accepts_nested_attributes_for :profiles
	accepts_nested_attributes_for :captain

	"def set_default_captain
	 if captain_id.changed?
       profiles.each do |user|
         user.captain = captain
         user.save
       end
     end
	end"


end
