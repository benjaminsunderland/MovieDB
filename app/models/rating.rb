class Rating < ApplicationRecord
	belongs_to :user
	belongs_to :movie

	validates :score, presence: true

	def self.find_recent_ratings(user:)
    	group = user.ratings.group_by(&:movie_id)
    	last_ratings_for_each_movie = group.map do |movie_id, ratings| 
    		ratings.sort_by { |rating| rating.created_at }.last
    	end
    end
end
