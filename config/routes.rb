Rails.application.routes.draw do
  root 'pages#index'

  get  "/" , to: 'pages#index'
end
