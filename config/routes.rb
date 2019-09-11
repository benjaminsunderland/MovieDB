Rails.application.routes.draw do
root to: "movies#index"

devise_for :users
  
  	get 'movies', to: 'movies#index'

	resources :users do
		resources :movies
	end
end