Rails.application.routes.draw do
  root 'users#new'

  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

end
