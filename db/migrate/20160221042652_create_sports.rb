class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sports do |t|
      t.string :sportname

      t.timestamps
    end
  end


  def self.down
  	drop_table :sports
  end
end
