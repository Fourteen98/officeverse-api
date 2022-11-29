Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/create'
  get 'reservations/destroy'
  namespace :api do
    namespace :v1 do
      resources :users do 
        resources :reservations
      end
      resources :services
      resources :peripherals
      resources :offices
    end
  end
  root "api/v1/offices#index"

end
