Rails.application.routes.draw do
  
  resources :yelp_searches

  resources :prefs, only: [:new, :create]
  resources :restrics, only: [:new, :create]

  resources :events
  
  resources :restrictions
  resources :preferences

  resources :restaurants
  resources :users do
    resources :restrics, only: [:new, :create]
    resources :prefs, only: [:new, :create]
  end
  
  #get '/users/:id/choices', to: "users#results", as: "user_results"
  root to: 'visitors#index'


  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
