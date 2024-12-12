Rails.application.routes.draw do
  devise_for :users
  devise_for :items
  
  resources :items
  
end
