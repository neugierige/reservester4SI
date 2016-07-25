# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories_list = [ 
	"American", "French", "Mexican", "Mediterranean", 
	"Chinese", "Japanese", "Korean", "Thai", 
	"Vietnamese", "Ethiopian", "Fast Food", 
	"Cafe", "Brasserie", "New American", "Drinks", 
	"Bakery", "Seafood", "Food truck", "Modern",  
	"Vegetarian", "Vegan", "Burgers", "Bistro"
]

categories_list.each do |name| 
	Category.create(category_name: name)
end