Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: 'recipes#index'

  get '/foods/:id', to: 'foods#show', as: 'food'
  get '/generalshoppinglist', to: 'generalshoppinglist#index'
  get '/public_recipes', to: 'recipes#public_list', as: 'public_recipes'
  get '/GeneralShoppingList', to: 'general_shopping_list#index', as: 'general_shopping_list'

  resources :foods, except: [:index] do
    collection do
      get 'missing_foods'
    end
  end
end
