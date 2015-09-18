class Profile < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	validates :street, :city, :state, :zipcode, presence: true

	belongs_to :user, inverse_of: :profile
	# adding 'inverse_of' forces active record to saving the user - profile model association.
	# and helping the validation line below pass
    validates_associated :user, presence: true, uniqueness: true 
    # using the line above validates that there not just a 'user_id' 
    # but also an actual user unlike the line below
    #validates :user_id, presence: true, uniqueness: true
end
