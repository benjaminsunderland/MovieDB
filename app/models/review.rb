class Review < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	
	validates :title, presence: true
	validates :content, presence: true

	def calculate_movie_score(user:)
		score = user.ratings.where(movie_id: movie.id).last
		self.movie_score = score 
	end
end