class Profile < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	validates :address, :age, presence: true

	belongs_to :user
end
