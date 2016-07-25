class CategoriesRestaurants < ActiveRecord::Migration
  def change
  	create_table :categories_restaurants do |t|
		t.references :category, index: true, foreign_key: true
  		t.references :restaurant, index: true, foreign_key: true
  	end
  end
end
