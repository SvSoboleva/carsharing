Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'v1/sessions'
  }

  namespace :v1, defaults: { format: :json } do
    #resources :sessions, only: [:create, :destroy, :show]
    resources :users, only: [:create]
    resources :orders
    resources :cars
  end
end
