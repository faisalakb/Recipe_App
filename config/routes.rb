Rails.application.routes.draw do
  devise_for :users
  
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  root to: 'foods#index'

  root to: 'recipes#index'

  # get '/foods/:id', to: 'foods#show', as: 'food'
  get '/missing_foods', to: 'foods#missing_foods'
  
  resources :foods, except: [:index] do
    collection do
      get 'missing_foods'
    end
  end

  resources :inventories do
    resources :inventory_foods, only: [:index, :create, :update, :destroy]
  end
end
