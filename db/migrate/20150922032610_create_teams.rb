class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :teamname
      t.string :teamcolor
      #t.references :captain

      t.timestamps
    end
  end
end
