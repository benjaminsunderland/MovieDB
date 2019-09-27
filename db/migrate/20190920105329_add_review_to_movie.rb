class AddReviewToMovie < ActiveRecord::Migration[5.0]
	def change
    	create_table :reviews do |t|
    		t.string :title
	    	t.text :content
	    	t.integer :movie_score
	    	t.references :movie
	    	t.references :user
	    	t.timestamps null: false
	    end
    end
end
