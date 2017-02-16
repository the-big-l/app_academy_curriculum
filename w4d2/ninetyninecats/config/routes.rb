Rails.application.routes.draw do
  resources :users
  get 'cat_rental_requests/new'

  post 'cat_rental_requests/create'

  get 'cat_rental_requests/edit'

  patch 'cat_rental_requests/update'

  patch 'cat_rental_requests/approve' as 'cat_approval'

  resources :cats, only: [:index, :show, :new, :create, :update, :edit]
  root 'cats#index'
end
