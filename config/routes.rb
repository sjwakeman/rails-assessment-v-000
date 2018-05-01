Rails.application.routes.draw do

  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/signup', to: 'sessions#signup'
  get '/signin', to: 'sessions#signin', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :trainers
  resources :clients
  resources :training_sessions
  resources :users

  root 'welcome#home'
end
