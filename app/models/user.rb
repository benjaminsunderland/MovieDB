class User < ApplicationRecord
	has_many :movies
	has_many :ratings
	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    after_create :send_admin_mail

	def self.find_ratings
  		User.includes(:ratings).all.map { |u| u.ratings.last }.compact 
    end

  	def send_admin_mail
    	UserMailer.send_new_user_message(self).deliver
  	end
end

