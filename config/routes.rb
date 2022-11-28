Rails.application.routes.draw do
  
  resources :users
  resources :services
  resources :offices, only: [:index, :show, :create, :delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
