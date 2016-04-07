class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :sportname

      t.timestamps
    end
  end
end
