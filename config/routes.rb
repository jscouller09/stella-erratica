Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home' # change to planets#index later

  # dashboard route
  get '/dashboard', to: 'pages#dashboard'

  # planets and new bookings
  resources :planets do
    resources :bookings, only: %i[new create]
  end

  # edit/delete bookings
  resources :bookings, only: %i[edit update destroy]
end
