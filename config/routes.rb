Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "auto_login", to: "pages#auto_login"

  get "dashboard", to: "dashboard#index"

  get "/categories", to: "categories#index", as: :categories
  get "/categories/:id", to: "categories#show", as: :category

  post "/user_goals", to: "user_goals#create" #form attention

  get "/goals/:id", to: "goals#show", as: :goal
  post "/user_badges", to: "user_badges#create", as: :user_badges
  delete "/user_badges/:id", to: "user_badges#destroy", as: :user_badge

  resources :user_goals, only: [:destroy]

  resource :profile, only: [:show, :edit, :update]

  post "/goals/:id/photos", to: "goals#add_photos"
  get "/goals/:id/gallery", to: "goals#gallery"
  delete "/goals/:id/photos/:photo_id", to: "goals#destroy_photo"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
