class MoviesController < ApplicationController
	before_action :find_user, only: %i[new edit create]
	before_action :find_movie, except: %i[index new create]
	before_action :authenticate_user!, except: %i[index show]

	def index
		@movies = Movie.filtered(params).order(created_at: :desc)
	end

	def new
		@movie = @user.movies.new
	end

	def create
    	@movie = @user.movies.new(movie_params)
    	if @movie.save!
    		redirect_to user_movie_path(@user, @movie), notice: "Successfully created movie!"
   		else
       		render :new
    	end
	end

	def show; end

	def edit; end

	def update
		if @movie.update(movie_params)
        	redirect_to user_movie_path(@movie), notice: "Updated movie!"
        else
        	render :edit
        end
	end

	def destroy
		if @movie.destroy
			redirect_to user_movies_path, notice: "Destroyed movie!"
		else
			redirect_to user_movie_path(@movie), alert: "Something went Wrong"
		end
	end

	private

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