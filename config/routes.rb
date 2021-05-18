Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    # registrations: 'devise/user',
    # sessions: 'devise/store_sessions'
  }

  devise_scope :user do
    get   'user',          to: 'devise/user#edit',   as: 'user'
    patch 'user/update_password', to: 'devise/user#update', as: 'update_password'
    patch 'user/email',    to: 'devise/user#update', as: 'update_user_email'
    get 'user/address',  to: 'address#edit'
    post 'user/address',  to: 'address#create' # это на будущие
    patch 'user/address',  to: 'address#update'
    get   'user/orders',   to: 'orders#index',       as: 'user_orders'
    get   'user/orders/:id', to: 'orders#show', as: 'user_order'
  end
  
  # resource :user, only: %i[edit] do
  #   collection do
  #     patch 'update_email'
  #     patch 'update_password'
  #   end
  # end
  
  # resources :books, only: %i[index show]

  resources :books, only: %i[index show] do
    resources :reviews, only: :create
  end
end
