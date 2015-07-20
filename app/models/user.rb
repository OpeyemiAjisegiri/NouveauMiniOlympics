class User < ActiveRecord::Base
	#attr_accessible :email, :password, :password_confirmation #No longer neededd in rails 4 
	#due to the advent of strong parameters

    before_save {self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                         format:{with: VALID_EMAIL_REGEX}, 
	                         uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
