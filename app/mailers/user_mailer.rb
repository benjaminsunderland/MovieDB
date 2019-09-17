class UserMailer < ApplicationMailer
	default from: "no-reply@moviedb.com"

	def send_user_new_message(user)
    	@user = user
    	mail(to: @user.email, subject: 'Welcome to MovieDB!')
    end
end
