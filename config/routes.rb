Rails.application.routes.draw do
  get 'wishlist/new'

  root "page#index"

  resources :listings
  resources :bookings
  resources :reviews, only: [:create, :index]

  devise_for :users
end
