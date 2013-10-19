Demo::Application.routes.draw do
  root to: 'hydra_attributes#index'

  resources :categories
  resources :products
  resources :hydra_attributes
end