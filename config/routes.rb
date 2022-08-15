Rails.application.routes.draw do
  resources :reviews

  root "page#index"

  resources :listings
  resources :bookings
  resources :reviews, only: [:create, :index]

  devise_for :users
end
