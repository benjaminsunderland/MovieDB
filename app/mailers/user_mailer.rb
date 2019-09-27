class UserMailer < ApplicationMailer
	def send_user_new_message(user)
    	@user = user
    	attachments.inline["pandora.jpg"] = File.read("#{Rails.root}/app/assets/images/pandora.jpg")
    	mail(to: 'ben@sunderland.eu.com', subject: 'Welcome to MovieDB!')
    end
end
