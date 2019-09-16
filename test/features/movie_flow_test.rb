require 'test_helper'

class MovieFlowTest < Capybara::Rails::TestCase
	include DeviseSignUp

	def setup
    	@movie = movies(:movie_1)
    	@user  = users(:benjamin)
	end

	before do
		sign_up_with_devise
	end

	test 'visit index' do
		visit movies_path
		page.must_have_content "My Movies"
		page.must_have_content "New Movie"
		page.must_have_content "Sign Out"
    end

    test 'sidebar is visibie and clickable' do
		visit movies_path

		Movie.category_types.each do |type|
			click_link type.first.humanize
		end

		create_movies
		visit movies_path
		click_link 'Horror'
		# page.must_have_css("image[alt=ratatouile]")
		# page.must_have_content "Donnie Darko"
		# page.must_have_content "one who flew over the cuckoo\'s nest"
    end

	test 'fill out form and go to show' do
		visit new_user_movie_path(User.last)
		fill_in('movie_title', with: 'Star Wars')
		fill_in('Text', with: 'Battle of the empires')
		select('Action', from: 'Category type')
		attach_file 'movie[image]', 'app/assets/images/toy_story.jpg'
		click_button 'Create Movie'

		page.must_have_content 'Successfully created movie!'

		page.must_have_content "Title"
		page.must_have_content "Star Wars"

		page.must_have_content "Category"
		page.must_have_content "action"

		page.must_have_content "Description"
		page.must_have_content "Battle of the empires"
    end

    def create_movies
		visit new_user_movie_path(User.last)
		fill_in('movie_title', with: 'ratatouile')
		fill_in('Text', with: 'Rat becomes the boss chef')
		select('Animation', from: 'Category type')
		click_button 'Create Movie'

		visit new_user_movie_path(User.last)
		fill_in('movie_title', with: 'head')
		fill_in('Text', with: 'Man gets locked up')
		select('Horror', from: 'Category type')
		click_button 'Create Movie'

		visit new_user_movie_path(User.last)
		fill_in('movie_title', with: 'eneverever')
		fill_in('Text', with: 'Pychological')
		select('Horror', from: 'Category type')
		click_button 'Create Movie'
	end
end