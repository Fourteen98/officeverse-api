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
      get 'services', to: 'services#all'
      get 'peripherals', to: 'peripherals#all'
    end
  end
  root "api/v1/offices#index"

end
