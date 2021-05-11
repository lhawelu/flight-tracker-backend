Rails.application.routes.draw do
  resources :flights
  resources :bookings
  resources :users, only: [:create]

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  get '/my-bookings', to:'users#my_bookings'
  
end
