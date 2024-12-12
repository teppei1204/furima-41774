Rails.application.routes.draw do
  devise_for :items

  root 'items#index'
  
end
