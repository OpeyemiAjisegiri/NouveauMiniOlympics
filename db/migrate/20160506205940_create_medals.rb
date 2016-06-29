class CreateMedals < ActiveRecord::Migration
  def change
   # create_table :medals do |t|

      #t.timestamps
   # end
  end

   def self.down
  	drop_table :medals
  end
end
