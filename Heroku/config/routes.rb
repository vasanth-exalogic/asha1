Rails.application.routes.draw do

  # Routes for Sessions Controller
  root "sessions#index"
  post '/sessions' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  # Routes for Admins Controller
  resources :admins

  # Routes for Users Controller
  resources :users
end
