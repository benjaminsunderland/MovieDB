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
				   category_type: 'action',
				   image: File.new("#{Rails.root}/app/assets/images/star_wars.jpg"))

user.movies.create!(title: 'Avatar', 
				   text: 'Utopia', 
				   category_type: 'animation',
				   image: File.new("#{Rails.root}/app/assets/images/avatar.jpg"))

user.movies.create!(title: 'Clockwork Orange', 
				   text: 'Madmen', 
				   category_type: 'horror',
				   image: File.new("#{Rails.root}/app/assets/images/clockwork_orange.jpg"))

user.movies.create!(title: 'One who flew over the cuckoo nest',
				   text: 'Jack Nicholson goes to the mental hosptial', 
				   category_type: 'comedy',
				   image: File.new("#{Rails.root}/app/assets/images/cuckoo.jpg"))

user.movies.create!(title: 'Howls moving castle', 
				   text: 'Howl battles his demons', 
				   category_type: 'animation',
				   image: File.new("#{Rails.root}/app/assets/images/moving_castle.jpg"))

user.movies.create!(title: 'Pandora', 
				   text: 'Utopia', 
				   category_type: 'animation',
				   image: File.new("#{Rails.root}/app/assets/images/pandora.jpg"))

user.movies.create!(title: 'Spirited Away', 
				   text: 'hiuweuhiwefihu', 
				   category_type: 'animation',
				   image: File.new("#{Rails.root}/app/assets/images/spirited_away.jpg"))

p '================================='
p 'success'
p '================================='
