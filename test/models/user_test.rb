require 'test_helper'

class UserTest < ActiveSupport::TestCase
	setup do
		@user = users(:benjamin)
	end
	should have_many(:movies)
	should have_many(:ratings)
end
