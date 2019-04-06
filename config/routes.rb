Rails.application.routes.draw do
  root 'welcome#index'
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: 'teams#show'

  resources :teams, only: [:new, :create]
end
