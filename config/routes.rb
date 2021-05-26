Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  get  'settings', to: 'users#edit'
  
  devise_scope :user do
    get 'user', to: 'devise/user#edit', as: 'user'
    get 'user/address', to: 'address#edit'
    patch 'user/address', to: 'address#update'
  end
  
  resource :user, only: %i[edit] do
    collection do
      patch 'update_email'
      patch 'update_password'
    end
  end

  resources :books, only: %i[index show]
end
