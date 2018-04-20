Rails.application.routes.draw do
root to: 'users#index'	

	resources :users do 
		resources :posts
	end
	resources :cities do 
		resources :posts
	end
end
