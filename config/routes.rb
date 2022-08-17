Rails.application.routes.draw do

  root "page#index"

  resources :listings do
    resources :bookings, except: [:index, :destroy]
  end

  resources :bookings, only: [:index, :destroy]

  resources :reviews

  resources :feedbacks, except: [:edit, :destroy]

  devise_for :users
end
