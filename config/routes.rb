Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  #devise_for :users
  resources :trainers
  #resources :users#
  resources :training_sessions
  get '/auth/facebook/callback' => 'sessions#create'


  root 'welcome#home'
end
