class User < ApplicationRecord
    has_many :movies
    has_many :ratings
    has_many :reviews

    after_create :send_admin_mail

	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    def send_admin_mail
        UserMailer.send_user_new_message(self).deliver
    end
end

