Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'

  resource :cart, path: 'cart'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }


  resources :books, only: %i[index show] do
    resources :reviews, only: :create
  end
  resources :cart, only: [:show, :update] 
end
