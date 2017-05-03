Rails.application.routes.draw do

	get '/signup', to: 'users#new'

	get '/contact', to: 'static_pages#contact'

	get '/about', to: 'static_pages#about'

	get '/login', to: 'sessions#new'

	post '/login', to: 'sessions#create'

	delete '/logout', to: 'sessions#destroy'

	root 'static_pages#home'

	resources :users

	resources :posts
end
