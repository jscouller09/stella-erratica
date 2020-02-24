Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home' # change to planets#index later

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :planets do
    resources :bookings, only: %i[new create]
  end

  namespace :dashboard do
    get '/', to: 'pages#dashboard'
    resources :bookings, only: %i[edit update destroy]
  end
end
