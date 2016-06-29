class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :sportname

      t.timestamps
    end

    create_table :medals do |t|
      t.references :sport
      t.references :gold,   index: true
      t.references :silver, index: true
      t.references :bronze, index: true

      t.timestamps null: false
    end
  end


  def self.down
  	drop_table :sports
  end
end
