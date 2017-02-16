Links::Application.routes.draw do
  resources :sessions

  resources :subreddits

  resources :comments

  resources :links

  resources :users

end
