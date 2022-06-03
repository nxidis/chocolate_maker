Rails.application.routes.draw do
  resources :batches
  resources :product_types
  get 'tracker/index'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tracker#index"
end
