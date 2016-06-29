class Medal < ActiveRecord::Base
	belongs_to :sport, inverse_of: :medal, dependent: :delete
	validates_associated :sport, presence: true, uniqueness: true 

    has_many :other_medals, :class_name => "Medal" #,    :foreign_key => :gold_id
    #has_many :???, :class_name => "Medal", :foreign_key => :silver_id
    #has_many :???, :class_name => "UMedal", :foreign_key => :bronze_id
    
    belongs_to :gold, :class => "Medal", :foreign_key => :gold_id
    belongs_to :silver, :class => "Medal", :foreign_key => :silver_id	
    belongs_to :bronze, :class => "Medal", :foreign_key => :bronze_id
end
