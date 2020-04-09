Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'attend', to: 'attendances#create'
  get 'not_attending', to: 'attendances#destroy'
  root 'pages#home'
  resources :users
  resources :sessions
  resources :events
  resources :attendances
end
