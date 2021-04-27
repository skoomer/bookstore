Rails.application.routes.draw do
  root 'pages#index'

  resources :books, only:[:index, :show]
  resources :login, only:[:index]
  resources :signup, only:[:index]
  resources :reset_password, only:[:index]
  resources :new_password, only:[:index]



end
