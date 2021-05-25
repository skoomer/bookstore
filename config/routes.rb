Rails.application.routes.draw do
  root 'pages#index'
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    # registrations: 'devise/user',
    # sessions: 'devise/store_sessions'

  }
  get  'settings', to: 'users#edit'
  

  # devise_scope :user do
  #   get   'user',          to: 'devise/user#edit',   as: 'user'
  #   patch 'user/password', to: 'devise/user#update', as: 'update_password'

  #   patch 'user/email', to: 'devise/user#update', as: 'update_email'
  #   get 'user/address',  to: 'address#edit'
  #   patch 'user/address',  to: 'address#update'
  # end
  
  resource :user, only: %i[edit] do
    collection do
      patch 'update_email'
      patch 'update_password'
    end
  end
  


  resources :books, only: %i[index show]
end
