Rails.application.routes.draw do
	
devise_for :users 

devise_scope :user do
	authenticated :user do
    	root 'movies#index', as: :authenticated_root
    end

    unauthenticated do
    	root 'devise/sessions#new', as: :unauthenticated_root
    end
end
  
get 'movies', to: 'movies#index'
get 'get_ratings', to: 'ratings#get_ratings'
post 'create_rating', to: 'ratings#create', as: 'create_rating'


	resources :users do
		resources :movies
	end
end