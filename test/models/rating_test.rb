require 'test_helper'

class RatingTest < ActiveSupport::TestCase
	setup do
		@rating = ratings(:rating_1)
	end

	should belong_to(:user)
	should belong_to(:movie)

	should validate_presence_of :score

	test 'self.find_recent_ratings' do 
		assert_equal [@rating], Rating.find_recent_ratings(user: users(:benjamin))
	end
end
