class Movies < ActiveRecord::Migration[5.0]
    def change
    create_table :movies do |t|
    	t.string :title
    	t.text :text
    	t.integer :category_type
    	t.references :user
    	t.timestamps null: false
    end
  end
end
