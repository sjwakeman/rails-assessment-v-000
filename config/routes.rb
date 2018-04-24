Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :trainers
  resources :users#
  resources :training_sessions
  get '/auth/facebook/callback' => 'sessions#create'

  root 'welcome#home'
end
