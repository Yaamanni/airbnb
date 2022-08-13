Rails.application.routes.draw do

  root "page#index"

  resources :listings
  resources :bookings

  devise_for :users
end
