Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/save_facebook_token', as: 'facebook_callback'

  resources :accounts

  devise_for :users

  root to: 'pages#index'

end
