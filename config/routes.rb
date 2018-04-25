Rails.application.routes.draw do

  get '/users/sign_out' => 'devise/sessions#destroy'


  resources :trainers
  resources :users
  resources :training_sessions
  get '/auth/facebook/callback' => 'sessions#create'

  root 'welcome#home'
end
