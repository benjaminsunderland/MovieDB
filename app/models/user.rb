class User < ApplicationRecord
	has_many :movies
	has_many :ratings
	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

	def self.find_ratings
  		User.includes(:ratings).all.map { |u| u.ratings.last }.compact 
    end
end
