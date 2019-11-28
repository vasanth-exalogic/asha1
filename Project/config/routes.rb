Rails.application.routes.draw do
  root "sessions#index"
  resources :users
  resources :admins, only: [:index, :create]
  resources :sessions, only: [:index, :create]
  get '/home' => "home#index"
  delete '/logout' => "admins#destroy", as: 'logout'
end
