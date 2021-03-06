# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    put '/users/edit',  to: 'users/registrations#update', as: :user_edit
  end
  resources :books, only: %i[index show]
end
