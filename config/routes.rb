Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: 'foods#index'

  get '/foods/:id', to: 'foods#show', as: 'food'
  
  resources :foods, except: [:index] do
    collection do
      get 'missing_foods'
    end
  end

  resources :inventories do
    resources :inventory_foods, only: [:index, :new, :create, :show, :update, :destroy]
  end  
end
