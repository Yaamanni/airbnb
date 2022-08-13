Rails.application.routes.draw do
  devise_for :users
  root "page#index"

  resources :listings
  resources :bookings


end
