Rails.application.routes.draw do


  #get '/auth/facebook/callback' => 'sessions#create'

  resources :trainers
  resources :clients
  resources :training_sessions
  resources :users

  get '/signup', to: 'sessions#signup'
  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  root 'welcome#home'
end
