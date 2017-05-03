class Silver < ActiveRecord::Base

	belongs_to :sport, inverse_of: :silver     #, dependent: :delete  
	validates_associated :sport, presence: true

	belongs_to :team, inverse_of: :silvers, counter_cache: true     
	validates_associated :team, uniqueness: true, presence: { :unless => :create}
end
