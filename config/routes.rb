Rails.application.routes.draw do

  get "/search", to: "search#search", as: :search
  post "/friends/:id", to: "friends#create", as: :friends
  get "/friends", to: "friends#index", as: :friends_index
  get "/friends/requests", to: "friends#requests", as: :friends_requests

  resources :friends, except: [ :create ]

  resources :likes, only: [ :destroy ]
  resources :comments, only: [ :destroy, :edit, :update ]

  resources :posts do
    resources :likes, only: [ :create ]
    resources :comments, except: [ :edit, :update, :destroy ]
  end
  
  devise_for :users, :controllers => {
    sessions: "custom/sessions"
  }
  
  root "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
