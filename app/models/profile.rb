class Profile < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	validates :address, :sex, presence: true

	belongs_to :user
end
