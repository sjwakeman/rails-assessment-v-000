Rails.application.routes.draw do
  resources :trainers
  resources :sessions
  resources :users
  resources :training_sessions

  #route for Omniauth to send its authentication data
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'welcome#home'
end
