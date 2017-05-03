class Bronze < ActiveRecord::Base

	belongs_to :sport, inverse_of: :bronze    #, dependent: :delete  
	validates_associated :sport, presence: true

	belongs_to :team, inverse_of: :bronzes, counter_cache: true
	validates_associated :team, uniqueness: true, presence: { :unless => :create}
end
