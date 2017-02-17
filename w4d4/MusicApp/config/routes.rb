Rails.application.routes.draw do
  resources :tracks, except: [:new]

  resources :albums, except: [:new] do
    resources :tracks, only: [:new]
  end

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  root 'sessions#new'
end
