class Bronze < ApplicationRecord

        #ApplicationRecord was added in rails -v 5.0, so 
        #ApplicationRecord::ActiveRecord::Base , it inherits from ActiveRecord which inherits from the Base class


	belongs_to :sport, inverse_of: :bronze    #, dependent: :delete  
	validates_associated :sport, presence: true

	belongs_to :team, inverse_of: :bronzes, counter_cache: true
	validates_associated :team, uniqueness: true, presence: { :unless => :create}
end
