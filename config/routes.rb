Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'
  get  'orders', to: 'orders#index'
  resources :order_items, only: %i[create update destroy]
  resource :cart, only: %i[show update]



  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :books, only: %i[index show] do
    resources :reviews, only: :create
  end

end
