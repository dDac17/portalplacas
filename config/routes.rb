Rails.application.routes.draw do
  root 'home#index'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check

  get "user/new"
  namespace :admin do
    resources :users
   end 
end
