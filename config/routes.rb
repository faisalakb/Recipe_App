Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'foods#index'

  get '/foods/:id', to: 'foods#show', as: 'food'
  
  resources :foods, except: [:index] do
    collection do
      get 'missing_foods'
    end
  end

  resources :inventories do
    resources :inventory_foods, only: [:index, :create, :update, :destroy]
  end
end
