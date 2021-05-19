Rails.application.routes.draw do
  root 'pages#index'
  # devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" } #defaults: { format: :json } 
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',

  }

  # devise_scope :user do
  #   get   'user',          to: 'devise/user#edit',   as: 'user'
  #   patch 'user/password', to: 'devise/user#update', as: 'update_user_password'
  #   patch 'user/email',    to: 'devise/user#update', as: 'update_user_email'
  #   patch 'user/address',  to: 'address#create',     as: 'user_address_forms'
  #   get   'user/orders',   to: 'orders#index',       as: 'user_orders'
  #   get   'user/orders/:id', to: 'orders#show', as: 'user_order'
  # end

  # resources :login, only:[:index]
  # resources :signup, only:[:index]

  # resources :reset_password, only:[:index]
  # resources :new_password, only:[:index]


  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  resources :books, only: %i[index show]
end
