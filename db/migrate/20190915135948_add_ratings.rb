class AddRatings < ActiveRecord::Migration[5.0]
	def change
	    create_table :ratings do |t|
	    	t.integer :score
	    	t.references :movie
	    	t.references :user
	    	t.timestamps null: false
	    end
    end
end
