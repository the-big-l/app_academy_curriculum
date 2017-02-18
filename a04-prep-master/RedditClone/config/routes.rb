Rails.application.routes.draw do
  resources :links
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root 'users#new'
end
