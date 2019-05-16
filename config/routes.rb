Rails.application.routes.draw do
  
  devise_for :users 

  namespace :v1 do
    resources :sessions, only: [:create, :destroy]
    resources :orders
    resources :cars
    resources :users, only: [:create]
  end
end
