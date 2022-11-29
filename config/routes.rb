Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :services
      resources :offices
    end
  end
  root "api/v1/offices#index"

end
