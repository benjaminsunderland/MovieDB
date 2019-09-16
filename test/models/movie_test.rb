require 'test_helper'

class MovieTest < ActiveSupport::TestCase
	setup do
		@movie = movies(:movie_1)
	end

	should belong_to(:user)
	should have_many(:ratings)

	should validate_presence_of :title
	should validate_presence_of :text

	test 'SEARCH FIELDS' do
		assert_equal %i[search title category_type], Movie::SEARCH_FIELDS
	end

	test 'category_types' do 
		assert_equal %w[action adventure animation comedy crime drama epics horror musicals sci_fi war westerns], Movie.category_types.keys
	end

	test 'self.filtered' do
		results = Movie.filtered(search: @movie.title)
		assert_equal @movie, results.first

		results = Movie.filtered(category_type: @movie.category_type)
		assert_equal @movie, results.first
	end

	test 'self.find_category_amount' do
		assert_equal 1, Movie.find_category_amount('animation')
	end

	test 'find_average_rating' do
		@movie.ratings.create(score: 3)
		@movie.ratings.create(score: 4)
		@movie.ratings.create(score: 5)

		assert_equal 4, @movie.find_average_rating
	end
end 
