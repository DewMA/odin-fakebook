Rails.application.routes.draw do
  resources :friends

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
