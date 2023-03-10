class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :email, unique: true
    	t.string :password_digest
    	t.string :remember_digest
    	t.boolean :admin, default: false
        t.references :captain, index: true
        t.references :team

      t.timestamps null: false
    end

    create_table :profiles do |t|
    	t.references :user
    	t.string :name
    	t.string :sex
    	t.string :street
    	t.string :city
    	t.string :state
    	t.string :zipcode
    	#t.string :sex

    	t.timestamps null: false
    end
  end
end
