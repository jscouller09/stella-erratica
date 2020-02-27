Rails.application.routes.draw do
  devise_for :users
  root to: 'planets#index'

  # dashboard route
  get '/dashboard', to: 'pages#dashboard'

  # planets and new bookings
  resources :planets do
    resources :bookings, only: %i[new create]
  end

  # edit/delete bookings
  resources :bookings, only: %i[edit update destroy]
end
