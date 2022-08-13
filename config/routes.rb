Rails.application.routes.draw do
  root "page#index"

  resources :listings
  resources :users, only: [:new]
end
