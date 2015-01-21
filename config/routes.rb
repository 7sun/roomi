Rails.application.routes.draw do
  root 'expenses#index'

  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :expenses

end
