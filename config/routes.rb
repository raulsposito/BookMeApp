Rails.application.routes.draw do

  get '/bookings/next_week'
  resources :users
  resources :bookings
  resources :schedules
  resources :clients
  resources :barbers
  resources :haircuts
  
  root 'static#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth' 
end
