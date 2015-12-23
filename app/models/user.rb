class User < ActiveRecord::Base
	#attr_accessible :email, :password, :password_confirmation #No longer neededd in rails 4 
	#due to the advent of strong parameters

    attr_accessor :remember_token

    before_save {self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                         format:{with: VALID_EMAIL_REGEX}, 
	                         uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	has_one :profile, inverse_of: :user, dependent: :destroy
    has_many :teammates, :class_name => "User", :foreign_key => "captain_id"
    
    belongs_to :captain, :class => "User"
    belongs_to :team



	#after_create :build_default_profile
	accepts_nested_attributes_for :profile
	accepts_nested_attributes_for :team

   
	def build_default_profile
		Profile.create(user: self)
	end
    
    class << self
	    #Returns the Hash digest of the given string
	    def digest(string)
	        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost)
	    end

	    #Returns a random token. 
	    def new_token
		    SecureRandom.urlsafe_base64
	    end
    end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
    
    #Returns true if the given token matches the digest
    def authenticated?(remember_token)
    	return false if remember_digest.nil?
    	BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
    	update_attribute(:remember_digest, nil)    	
    end
end
