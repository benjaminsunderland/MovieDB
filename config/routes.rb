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

get 'get_reviews', to: 'reviews#get_reviews'

	resources :users do
		resources :movies do 
			resources :reviews, only: %i[create edit update destroy]
			# post 'create_review', to: 'reviews#create'
			# get 'edit_review/:review', to: 'reviews#edit', as: 'edit_review'
			# patch 'update_review/:review', to: 'reviews#update', as: 'update_review'
			# delete 'destroy_review/:review', to: 'reviews#destroy', as: 'destroy_review'
		end
	end
end