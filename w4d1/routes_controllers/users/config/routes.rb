Rails.application.routes.draw do
  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :contacts, only: [:index]
    member do
      get 'favorites/' => 'users#favorites'
    end
  end
  resources :contacts, only: [:show, :update, :destroy, :create]
  resources :contact_shares, only: [:destroy, :create, :update]

  # Prefix Verb   URI Pattern               Controller#Action
    # get 'users/' => 'users#index'
    # post 'users/' => 'users#create'
    # get 'users/new/' => 'users#new', :as =>'new_user'
    # get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
    # get 'users/:id' => 'users#show', :as => 'user'
    # patch 'users/:id' => 'users#update'
    # delete 'users/:id' => 'users#destroy'
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy

end
