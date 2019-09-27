require 'test_helper'

class ReviewsIntegrationTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	setup do 
    	@review = reviews(:review_one)
    	@user   = users(:benjamin)
    	@movie  = movies(:movie_1)
	end

	before do
		sign_in @user
	end

	test 'create' do
		assert_difference('Review.count', 1) do 
			xhr :post, user_movie_reviews_path(movie_id: @movie.id, user_id: @user.id), {review: { title: 'first_review', content: 'example_content', movie_score: 5 } }
		end
		assert_template :success
	end

	test 'create fail' do
		assert_no_difference('Review.count') do 
			xhr :post, user_movie_reviews_path(movie_id: @movie.id, user_id: @user.id), {review: { title: '', content: '', movie_score: 5 } }
		end
		assert_template :fail
	end

	test 'edit' do
		xhr :get, edit_user_movie_review_path(movie_id: @movie.id, user_id: @user.id, id: @review)
		assert_template :edit
	end

	test 'update' do
		xhr :patch, user_movie_review_path(movie_id: @movie.id, user_id: @user.id, id: @review), {review: { title: 'updated_review', content: 'updated_content', movie_score: 5 } }
		assert_template :update
		@review.reload
		assert_equal 'updated_review', @review.title
		assert_equal 'updated_content', @review.content
	end

	test 'destroy' do
		assert_difference('Review.count', -1) do 
			xhr :delete, user_movie_review_path(movie_id: @movie.id, user_id: @user.id, id: @review), {review: { title: 'updated_review', content: 'updated_content', movie_score: 5 } }
		end
		assert_template :destroy
	end

	test 'get reviews' do
	    xhr :get, get_reviews_path(movie_id: @movie.id)
		assert_template :get_reviews
	end
end