class Rating < ApplicationRecord
	belongs_to :user
	belongs_to :movie

	validates :score, presence: true

	def find_last_rating(user, movie)
		Rating.where(user: user, movie: movie).last
	end
end
