class Medal < ApplicationRecord
 
        #ApplicationRecord was added in rails -v 5.0, so
        #ApplicationRecord::ActiveRecord::Base , it inherits from ActiveRecord which inherits from the Base class



	belongs_to :sport, inverse_of: :medal, dependent: :delete
	validates_associated :sport, presence: true, uniqueness: true 

    #has_many :other_medals, :class_name => "Medal" 
    
    #belongs_to :gold, :class => "Medal", :foreign_key => :gold_id
    #belongs_to :silver, :class => "Medal", :foreign_key => :silver_id	
    #belongs_to :bronze, :class => "Medal", :foreign_key => :bronze_id
    
    validates :gold,   presence: true, uniqueness: true, :on => :update #,allow_nil: true
    validates :silver, presence: true, uniqueness: true, :on => :update #, allow_nil: true
    validates :bronze, presence: true, uniqueness: true, :on => :update #, allow_nil: true
end
