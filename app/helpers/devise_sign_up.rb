module DeviseSignUp
	def sign_up_with_devise
		visit new_user_registration_path
		fill_in('Email', with: 'John@gmail.com')
		fill_in('Password', with: 'password')
		fill_in("Password confirmation", with: 'password')
		click_on('Sign up')
	end
end