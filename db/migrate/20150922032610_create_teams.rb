class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :teamname
      t.string :teamcolor
      t.integer :golds_count, default: 0
      t.integer :silvers_count, default: 0
      t.integer :bronzes_count, default: 0
      #t.references :captain

      t.timestamps
    end
  end

  #add_column :teams, :silvers_count, :int
end
