Rails.application.routes.draw do
  resources :cases do
    resources :defendants do
      resources :products
    end
  end

  # Add this line to have a direct route to products
  resources :products

  get 'defendants/index'
  get 'defendants/new'
  get 'defendants/edit'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :cases
      resources :products
      resources :defendants do
        resources :products
      end
    end
  end

  resources :cases do
    resources :defendants, only: [:index]
  end
end
