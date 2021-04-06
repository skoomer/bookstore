Rails.application.routes.draw do
  
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # devise_for :users
  # resources :photos, only: [:new, :create, :index, :edit, :update]
  
  
  # post '/auth/:provider/callback', to: 'sessions#create'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'pages/index'
  root to: 'pages#index'


end
