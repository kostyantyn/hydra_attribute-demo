Demo::Application.routes.draw do
  root to: 'categories#index'

  resources :categories
  resources :products
  resources :hydra_attributes
end
