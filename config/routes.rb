Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items

  root "orders#index"
  resources :orders, only: [:index, :new]
end


# resources :user, only: [:show] 
