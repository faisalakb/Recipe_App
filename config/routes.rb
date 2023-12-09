Rails.application.routes.draw do
  devise_for :users

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    post 'add_food', on: :member
    resources :recipe_foods, only: [:index, :new, :create, :show, :update, :destroy]
  end

  resources :foods, except: [:index] do
    collection do
      get 'missing_foods'
    end
  end

  resources :inventories do
    resources :inventory_foods, only: [:index, :new, :create, :show, :update, :destroy]
  end

  # Define other routes as needed...

  get '/generalshoppinglist', to: 'generalshoppinglist#index'
  get '/public_recipes', to: 'recipes#public_list', as: 'public_recipes'
  get '/GeneralShoppingList', to: 'general_shopping_list#index', as: 'general_shopping_list'

  # Ensure that the root route is defined at the end
  root to: 'foods#index'
end
