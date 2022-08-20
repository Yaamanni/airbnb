Rails.application.routes.draw do

  root "page#index"

  resources :listings do
    resources :bookings, except: [:index, :destroy]
    resources :reviews, except: [:destroy]
  end

  resources :bookings, only: [:index, :destroy]
  resources :reviews, only: [:index, :destroy]
  resources :wishlist, only: [:create, :index]

  resources :feedbacks, except: [:edit, :destroy]

  devise_for :users
end
