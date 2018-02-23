class CreateTeamsports < ActiveRecord::Migration[5.1]
  def change
    create_table :teamsports do |t|  
    # missing :=>  ', :id => false' before 'do' -- only used in HABTM relationship 
    #to keep the migration from generating a primary key in the join table.

    	t.belongs_to :team, index: true
    	t.belongs_to :sport, index: true

      t.timestamps null: false
    end
  end

  def self.down
  	 drop_table :teamsports
  end
end
