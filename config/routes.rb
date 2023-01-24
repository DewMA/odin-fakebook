Rails.application.routes.draw do

  resources :likes, only: [ :destroy ]

  resources :posts do
    resources :likes, only: [ :create ]
    resources :comments
  end
  
  devise_for :users
  
  root "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
