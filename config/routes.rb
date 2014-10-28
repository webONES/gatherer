Rails.application.routes.draw do
  resources :posts

  get 'pages/index'
  get 'pages/gatherer'
  get 'accounts/save_facebook_token', as: 'facebook_callback'

  resources :accounts

  devise_for :users

  root to: 'pages#index'

  get 'auth/twitter/callback', to: 'accounts#twitter_callback'

  resources :users, only:[:edit, :update]
end
