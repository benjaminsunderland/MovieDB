class MoviesController < ApplicationController
	before_action :find_user, only: %i[new edit create update]
	before_action :find_movie, except: %i[index new create]
	before_action :authenticate_user!, except: %i[index show]
	before_action :authorize_user, only: %i[edit update destroy]

	def index
		if params[:my_movies].present?
			@movies = Movie.includes(:user, :ratings, :reviews).filtered(params)
								  .paginate(page: params[:page], per_page: 10)
								  .order(created_at: :desc).where(user: current_user)
		else
			@movies = Movie.includes(:user, :ratings, :reviews).filtered(params)
						   .paginate(page: params[:page], per_page: 10)
						   .order(created_at: :desc)
		end
	end

	def new
		@movie = @user.movies.new
	end

	def create		
    	@movie = @user.movies.new(movie_params)    	
    	if @movie.save
    		redirect_to user_movie_path(@user, @movie), notice: "Successfully created movie!"
   		else
       		redirect_to new_user_movie_path(@user), alert: @movie.errors.full_messages.to_sentence
    	end
	end

	def show
		@review = @movie.reviews.new
	end

	def edit; end

	def update
		if @movie.update(movie_params)
        	redirect_to user_movie_path(@movie), notice: "Updated movie!"
        else
        	redirect_to edit_user_movie_path(@user, @movie), alert: @movie.errors.full_messages.to_sentence
        end
	end

	def destroy
		if @movie.destroy
			redirect_to user_movies_path, notice: "Destroyed movie!"
		else
			redirect_to user_movie_path(@movie), alert: @movie.errors.full_messages.to_sentence
		end
	end

	private

	def authorize_user
		if @movie.user != current_user
			return redirect_to movies_path, notice: 'Unauthorized'
		end
	end

	def find_user
		@user = User.find(params[:user_id])
	end

	def find_movie
    	@movie = Movie.find(params[:id])
	end

	def movie_params
		params.require(:movie).permit(:title, :text, :category_type, :image);
	end
end