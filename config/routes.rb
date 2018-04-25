Rails.application.routes.draw do

  get '/clients/sign_out' => 'sessions#destroy'


  resources :trainers
  resources :clients
  resources :training_sessions
  get '/auth/facebook/callback' => 'sessions#create'

  root 'welcome#home'
end
