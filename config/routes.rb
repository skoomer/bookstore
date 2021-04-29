Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" } #defaults: { format: :json } 
  # resources :users
  
  root 'pages#index'

  resources :books, only:[:index, :show]
  resources :login, only:[:index]
  resources :signup, only:[:index]
  resources :reset_password, only:[:index]
  resources :new_password, only:[:index]



  # devise_scope :user do
    # get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end
