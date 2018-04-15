Rails.application.routes.draw do
  resources :trainers
  resources :sessions
  resources :users

  root 'users#home'
end
