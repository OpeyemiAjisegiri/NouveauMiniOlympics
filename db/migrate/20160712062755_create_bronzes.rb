class CreateBronzes < ActiveRecord::Migration
  def change
    create_table :bronzes do |t|
      t.references :sport,   index: true
      t.references :team,   index: true
      
      t.timestamps
    end
  end

  def self.down
  	drop_table :bronzes
  end
end
