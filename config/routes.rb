Rails.application.routes.draw do
  root 'pages#index'
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'devise/user',
    # sessions: 'devise/store_sessions'
  }

  devise_scope :user do
    get   'user',          to: 'devise/user#edit',   as: 'user'
    patch 'user/update_password', to: 'devise/user#update', as: 'update_password'
    patch 'user/email',    to: 'devise/user#update', as: 'update_user_email'
    patch 'user/address',  to: 'address#create',     as: 'user_address_forms'
    get   'user/orders',   to: 'orders#index',       as: 'user_orders'
    get   'user/orders/:id', to: 'orders#show', as: 'user_order'
  end
  
  resource :user, only: %i[edit] do
    collection do
      patch 'update_email'
      patch 'update_password'
    end
  end
  resources :books, only:[:index, :show]
  # resources :login, only:[:index]
  # resources :signup, only:[:index]

  # resources :reset_password, only:[:index]
  # resources :new_password, only:[:index]


  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  # get 'settings', to: 'users#edit'
  resources :books, only: %i[index show]
end
