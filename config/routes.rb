Rails.application.routes.draw do

  get 'pages/index'

  root 'pages#index'
  
  # post '/auth/:provider/callback', to: 'sessions#create'

end
