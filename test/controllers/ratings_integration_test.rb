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
end