Rails.application.routes.draw do
  root "page#index"

  resources :listings
  resources :bookings
  resources :reviews

  devise_for :users
end
