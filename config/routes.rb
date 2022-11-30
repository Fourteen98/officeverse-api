Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do 
        resources :reservations do
          resources :services
          resources :peripherals
        end
      end
      resources :offices
    end
  end
  root "api/v1/offices#index"

end
