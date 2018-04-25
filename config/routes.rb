Rails.application.routes.draw do

  get '/clients/sign_out' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :trainers
  resources :clients
  resources :training_sessions
  resources :users
  
  #get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'
  #post '/logout' => 'sessions#destroy'
  #resources :users, only: [:new, :create]

  root 'welcome#home'
end
