Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :books

  # Login and logout routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy" # Add this route for logout
  get "logs", to: "logs#index", as: "logs"

  # Root route
  root "users#new"
end
