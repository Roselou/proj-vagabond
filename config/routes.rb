Rails.application.routes.draw do
root to: 'users#index'

	 delete '/cities/:city_id/posts/:id', to: 'posts#destroy', as: 'destroy_post'

	resources :users do
		resources :posts
	end
	resources :cities do
		resources :posts
	end

	get '/login', to: 'sessions#new'
	post '/sessions', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'
end

# Prefix Verb   URI Pattern                                                                              Controller#Action
# 	root GET    /                                                                                        users#index
# destroy_post DELETE /cities/:city_id/posts/:id(.:format)                                                     posts#destroy
# user_posts GET    /users/:user_id/posts(.:format)                                                          posts#index
# 			 POST   /users/:user_id/posts(.:format)                                                          posts#create
# new_user_post GET    /users/:user_id/posts/new(.:format)                                                      posts#new
# edit_user_post GET    /users/:user_id/posts/:id/edit(.:format)                                                 posts#edit
# user_post GET    /users/:user_id/posts/:id(.:format)                                                      posts#show
# 			 PATCH  /users/:user_id/posts/:id(.:format)                                                      posts#update
# 			 PUT    /users/:user_id/posts/:id(.:format)                                                      posts#update
# 			 DELETE /users/:user_id/posts/:id(.:format)                                                      posts#destroy
#  users GET    /users(.:format)                                                                         users#index
# 			 POST   /users(.:format)                                                                         users#create
# new_user GET    /users/new(.:format)                                                                     users#new
# edit_user GET    /users/:id/edit(.:format)                                                                users#edit
# 	user GET    /users/:id(.:format)                                                                     users#show
# 			 PATCH  /users/:id(.:format)                                                                     users#update
# 			 PUT    /users/:id(.:format)                                                                     users#update
# 			 DELETE /users/:id(.:format)                                                                     users#destroy
# city_posts GET    /cities/:city_id/posts(.:format)                                                         posts#index
# 			 POST   /cities/:city_id/posts(.:format)                                                         posts#create
# new_city_post GET    /cities/:city_id/posts/new(.:format)                                                     posts#new
# edit_city_post GET    /cities/:city_id/posts/:id/edit(.:format)                                                posts#edit
# city_post GET    /cities/:city_id/posts/:id(.:format)                                                     posts#show
# 			 PATCH  /cities/:city_id/posts/:id(.:format)                                                     posts#update
# 			 PUT    /cities/:city_id/posts/:id(.:format)                                                     posts#update
# 			 DELETE /cities/:city_id/posts/:id(.:format)                                                     posts#destroy
# cities GET    /cities(.:format)                                                                        cities#index
# 			 POST   /cities(.:format)                                                                        cities#create
# new_city GET    /cities/new(.:format)                                                                    cities#new
# edit_city GET    /cities/:id/edit(.:format)                                                               cities#edit
# 	city GET    /cities/:id(.:format)                                                                    cities#show
# 			 PATCH  /cities/:id(.:format)                                                                    cities#update
# 			 PUT    /cities/:id(.:format)                                                                    cities#update
# 			 DELETE /cities/:id(.:format)                                                                    cities#destroy
#  login GET    /login(.:format)                                                                         sessions#new
# sessions POST   /sessions(.:format)                                                                      sessions#create
# logout GET    /logout(.:format)
