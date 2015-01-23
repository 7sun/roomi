Rails.application.routes.draw do
  root 'pages#home'

  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  resources :expenses
  resources :groups

end
