Rails.application.routes.draw do
  resources :posts

  get 'pages/index'
  get 'pages/gatherer'
  get 'pages/twitter'
  get 'pages/facebook'

  resources :accounts

  devise_for :users

  root to: 'pages#index'

  get 'callback/save_facebook_token', to:'accounts#save_facebook_token', as: 'facebook_callback'
  get 'auth/twitter/callback', to: 'accounts#twitter_callback'
  # get 'twitter/publish', as: 'twitter_publish'

  resources :users, only:[:edit, :update]
end
