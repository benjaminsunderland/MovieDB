# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p '================================='
p 'executing'
p '================================='

user = User.create!(email: 'test@example.com', password: 'password')

user.movies.create!(title: 'Toy Story', 
				   text: 'Family Animation Movie', 
				   category_type: 'animation',
				   image: File.new("#{Rails.root}/app/assets/images/toy_story.jpg"))

user.movies.create!(title: 'Star Wars', 
				   text: 'Good VS Evil', 
				   category_type: 'sci_fi',
				   image: File.new("#{Rails.root}/app/assets/images/star_wars.jpg"))

user.movies.create!(title: 'Avatar', 
				   text: 'Utopia', 
				   category_type: 'animation',
				   image: File.new("#{Rails.root}/app/assets/images/avatar.jpg"))

p '================================='
p 'success'
p '================================='
