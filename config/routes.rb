Rails.application.routes.draw do
  resources :configurations

  devise_for :users

  root to: 'configurations#index'
  
end
