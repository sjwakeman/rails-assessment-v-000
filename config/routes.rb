Rails.application.routes.draw do

  resources :clients do #defines all routes for :clients
  # nested resource for training_sessions
  resources :training_sessions, only: [:show, :index, :new]
  end
  
  #get '/auth/facebook/callback' => 'sessions#create' specific to facebook only
  get '/auth/:provider/callback', to: 'sessions#create' #Valid for any login provider
 
  get '/training_sessions/am', to: 'training_sessions#morning'
  get '/training_sessions/pm', to: 'training_sessions#evening'
  
  get '/signup', to: 'sessions#signup'
  get '/signin', to: 'sessions#signin', as: 'signin'
  get '/training_session/:id/destroy', to: 'training_sessions#destroy'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :trainers
  #resources :clients (dont need) 
  resources :training_sessions
  resources :users

  root 'welcome#home'
end
