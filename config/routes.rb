Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "dashboard", to: "dashboard#index"
  
  get "/categories", to: "categories#index", as: :categories
  get "/categories/:id", to: "categories#show", as: :category

  post "/user_goals", to: "user_goals#create" #form attention

  get "/goals/:id", to: "goals#show", as: :goal
  post "/user_badges", to: "user_badges#create", as: :user_badges




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
