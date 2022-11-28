Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :services
    end
  end
  root "users#index"
end
