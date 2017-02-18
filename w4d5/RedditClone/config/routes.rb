Rails.application.routes.draw do
  resources :users
  resources :comments
  resource :session
  resources :subs do
    resources :posts, only: [:new, :create]
  end
  resources :posts, except: [:new, :create]
end
