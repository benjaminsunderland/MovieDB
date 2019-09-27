require 'test_helper'

class UserTest < ActiveSupport::TestCase
	setup do
		@user = users(:benjamin)
	end

	should have_many(:movies)
	should have_many(:ratings)

	test 'email delivered when user is created' do
		assert_difference('ActionMailer::Base.deliveries.count') do
			User.create(email: 'some_example@gmail.com',
						password: 'password',
						password_confirmation: 'password')
		end 
	end
end
