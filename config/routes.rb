Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
  resources :items, only: [:index, :create, :show]
  

  resources :users, only: [:new, :create]
end
