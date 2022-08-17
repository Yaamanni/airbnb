Rails.application.routes.draw do

  get 'wishlist/new'


  root "page#index"

  resources :listings do
    resources :bookings, except: [:index, :destroy]
  end


  root "page#index"

  resources :listings
  resources :bookings
  resources :reviews, only: [:create, :index]
  resources :wishlist, only: [:create, :index]

  resources :feedbacks, except: [:edit, :destroy]

  devise_for :users
end
