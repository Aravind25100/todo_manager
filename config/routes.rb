Rails.application.routes.draw do
  resources :todos
  resources :users
  post "users/login", to: "users#login"
  get "/" => "home#index"
  root to: "home#index"

  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
end
