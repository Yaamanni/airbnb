Rails.application.routes.draw do

  root "page#index"

  get 'users/new'
  resources :listings
  resources :users, only: [:new]
end
