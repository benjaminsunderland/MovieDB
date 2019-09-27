require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
	setup do
		@review = reviews(:review_one)
	end

	should belong_to(:user)
	should belong_to(:movie)

	should validate_presence_of :title
	should validate_presence_of :content

	test 'calculate movie score' do
		assert_equal ratings(:rating_1), @review.calculate_movie_score(user: users(:benjamin))
	end
end
