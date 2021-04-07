Rails.application.routes.draw do

  get 'pages/index'

  root 'pages#index'
  
  # post '/auth/:provider/callback', to: 'sessions#create'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
