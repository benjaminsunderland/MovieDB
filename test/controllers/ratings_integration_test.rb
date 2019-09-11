require 'test_helper'

class RatingsIntegrationTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	setup do 
    	@rating = ratings(:rating_1)
    	@movie  = movies(:movie_1)
    	@user   = users(:benjamin)
	end

	before do
		sign_in @user
	end

	# test 'create rating' do		
	# 	assert_difference('Movie.count') do 
	# 		post create_rating_path, { rating: { score: 5 }, movie_id: @movie.id }, xhr: true
	# 	end 
	# end
end