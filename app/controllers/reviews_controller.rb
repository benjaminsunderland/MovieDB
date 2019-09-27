class ReviewsController < ApplicationController
	before_action :find_movie, only: %i[create get_reviews destroy]
	before_action :find_review, only: %i[edit destroy update]
    respond_to :js

	def create
		@review = @movie.reviews.create(review_params)
		@review.user = @movie.user
    
    	if @review.save 
    		render :success 
   		else
       		render :fail 
    	end
    end

    def edit; end

    def update
        @review.update(review_params)
    end

    def destroy
    	@review.destroy
    	@reviews = @movie.reviews
    end
    
    def get_reviews
    	@reviews = Review.includes(:user, :movie).where(movie: @movie)
    end

    private 

    def review_params
		params.require(:review).permit(:title, :content, :movie_score);
	end

	def find_review
		@review = Review.find(params[:id])
	end

	def find_movie
		@movie = Movie.find(params[:movie_id])
	end	
end