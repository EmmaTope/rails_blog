Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'home',  to: 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles
  resources :users, except: [:new, :create]
  resources :categories, except: [:destroy]

  get 'signup',     to: 'users#new'
  post 'signup',     to: 'users#create'
  get 'login',      to: 'sessions#new'
  post 'login',     to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
end
