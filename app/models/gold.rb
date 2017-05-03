class Gold < ActiveRecord::Base

	belongs_to :sport, inverse_of: :gold    #, dependent: :delete  
	validates_associated :sport, presence: true

	belongs_to :team, inverse_of: :golds, counter_cache: true     
	validates_associated :team, uniqueness: true, presence: { :unless => :create}

	### The line below might work ****** Not Tested
	#validates_associated :team,uniqueness: true, presence: { allow_nil: { on: :create}}            
end
