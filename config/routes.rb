Rails.application.routes.draw do

  # product routes
  root to: 'products#index'
  resources :products, only: [:index, :show]

  # categories routes
  resources :categories, only: [:index, :show]

  # cart routes
  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  # order routes
  resources :orders, only: [:create, :show]

  # admin routes
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show]
  end

  #about routes
  resource :about, only: [:show] do
    root to: 'about#show'
  end

  # users signup routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # users login routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
