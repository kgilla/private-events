Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  
  root 'pages#home'
  resources :users
  resources :sessions
end
