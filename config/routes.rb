Rails.application.routes.draw do


  root "page#index"

  root "page#index"
  resources :listings
  resources :users
  resources :bookings

  devise_for :users
end
