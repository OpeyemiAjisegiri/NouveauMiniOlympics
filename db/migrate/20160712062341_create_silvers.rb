class CreateSilvers < ActiveRecord::Migration[5.1]
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
