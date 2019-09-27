class RatingsController < ApplicationController
	before_action :find_movie, only: :create
	respond_to :js

	def create
   		@rating = @movie.ratings.create(rating_params)
   		@rating.user = @movie.user

    	if @rating.save
    		format.js { render :success }
   		else
       		format.js { render :fail }
    	end
	end

	def get_ratings
		@ratings = Rating.find_recent_ratings(user: current_user)
	end

	private 

	def find_movie
		@movie = Movie.find(params[:movie_id])
	end
	
	def rating_params
		params.require(:rating).permit(:score);
	end
end