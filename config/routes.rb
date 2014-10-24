Rails.application.routes.draw do
  
  resources :events

  resources :restaurants
  resources :restrictions
  resources :preferences

  resources :users do
    resources :restrictions_users
  end
  

put '/tests/:id', to: "tests#update", as: "update_tests"
get '/users/:id/restrictions', to: "users#userRestrics", as: "user_restrics"
#get '/users/:id/restrictions', to: "users#userRestrics_update", as: "update_user_restrics"
#get '/users/:id/cuisines', to: "users#userPrefs", as: "user_prefs"
#get '/users/:id/cuisines_up', to: "users#userPrefs_update", as: "update_user_prefs"
#get '/users/:id/choices', to: "users#results", as: "user_results"

  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
