Rails.application.routes.draw do
  root 'pages#index'

  # get  '/catalog', to: 'categories#index', as: 'category'
  # resources :catalog, only:[:index, :show], controller: 'categories'
  resources :books, only:[:index, :show]
end
