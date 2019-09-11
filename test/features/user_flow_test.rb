require 'test_helper'

class UserFlowTest < Capybara::Rails::TestCase
	def setup
    	@user  = users(:benjamin)
	end

	test 'sign up' do
		visit new_user_registration_path
		fill_in('Email', with: 'John')
		fill_in('Password', with: 'password_example')
		fill_in("Password confirmation", with: 'password_example')
		click_button('Sign up')
 	end

 	test 'sign in' do
 		visit new_user_session_path
 		fill_in('Email', with: 'John')
		fill_in('Password', with: 'password_example')
		click_button('Log in')
 	end

 	test 'forgot password' do
 		visit new_user_session_path
 		click_link('Forgot your password?')
 	end
end