Demo::Application.routes.draw do
  root to: 'hydra_attributes#index'

  resources :categories
  resources :products
  resources :hydra_attributes do
    resources :hydra_attribute_sets, only: [] do
      collection do
        get  :edit_hydra_set_relations
        post :update_hydra_set_relations
      end
    end
  end
  resources :hydra_sets do
    resources :hydra_attribute_sets, only: [] do
      collection do
        get  :edit_hydra_attribute_relations
        post :update_hydra_attribute_relations
      end
    end
  end
end