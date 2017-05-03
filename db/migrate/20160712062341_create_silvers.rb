class CreateSilvers < ActiveRecord::Migration
  def change
    create_table :silvers do |t|
      t.references :sport,   index: true
      t.references :team,   index: true

      t.timestamps
    end
  end

  def self.down
  	drop_table :silvers
  end
end
