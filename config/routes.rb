Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'v1/sessions'
  }

  namespace :v1, defaults: { format: :json } do
    resources :users, only: [:create]
    resources :orders
    resources :cars do
      resources :telemetries, only: [:create]
    end  
  end
end
