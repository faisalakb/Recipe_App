Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
=======
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
>>>>>>> 113650727911b45c03c4ae59595764e15d9d6603

  get "up" => "rails/health#show", as: :rails_health_check

<<<<<<< HEAD
  root to: 'foods#index'
=======
  # Defines the root path route ("/")
  # root "posts#index"

  root to: 'recipes#index'
>>>>>>> 113650727911b45c03c4ae59595764e15d9d6603

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
