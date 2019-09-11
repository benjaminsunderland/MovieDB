require 'test_helper'

class MoviesIntegrationTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	setup do 
    	@movie = movies(:movie_1)
    	@user  = users(:benjamin)
	end

	before do
		sign_in @user
	end

	test 'movies path' do
		get movies_path
		assert_response :success
	end

	test 'user movies path' do
		get user_movies_path(@user)
		assert_response :success
	end	

	test 'redirect no sign in' do
		sign_out @user
		get new_user_movie_path(@user)
		assert_response :redirect
	end

	test 'new movie' do		
		get new_user_movie_path(@user)
		assert_response :success
	end

	test 'create movie success' do		
		assert_difference('Movie.count') do 
			post user_movies_path(@user), { movie: { title: 'Batman', text: 'Superhero', category_type: 'action'} }
		end 
		@movie = assigns(:movie)
		assert_redirected_to user_movie_path(@user, @movie)
	end

	test 'create movie fail (requires title, text)' do		
		assert_no_difference('Movie.count') do 
			post user_movies_path(@user), { movie: { title: '', text: '', category_type: 'action'} }
		end
		assert_redirected_to new_user_movie_path(@user)
	end 

	test 'get show' do
		get user_movie_path(@user, @movie)
		assert_response :success
	end

	test 'get edit' do
		get edit_user_movie_path(@user, @movie)
		assert_response :success
	end

	test 'patch success' do
		patch user_movie_path(@user, @movie), { movie: { title: 'updated_title' } }
		@movie.reload
		assert_equal 'updated_title', @movie.title
		assert_redirected_to user_movie_path(@movie)
	end

	test 'patch fail (wrong title)' do
		patch user_movie_path(@user, @movie), { movie: { title: '' } }
		@movie.reload
		assert_equal 'Toy Story', @movie.title
		assert_redirected_to edit_user_movie_path(@user, @movie)
	end

	test 'destrpy success' do
		assert_difference('Movie.count', -1) do
			delete user_movie_path(@user, @movie)
		end
	end
end