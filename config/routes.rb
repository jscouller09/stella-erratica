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
  resources :bookings, only: %i[destroy]
  patch '/bookings/:id/approve', to: 'bookings#approve_booking', as: 'approve_booking'
  patch '/bookings/:id/complete', to: 'bookings#complete_booking', as: 'complete_booking'
  patch '/bookings/:id/reject', to: 'bookings#reject_booking', as: 'reject_booking'
end
