Rails.application.routes.draw do

  resources :keywords, only: [ :index, :new, :create, :edit, :update, :destroy ]

  get "businesses/:id/edit_gallery", to: "businesses#edit_gallery"
  resources :businesses do
    resources :keywords, only: [ :index, :new, :create, :edit, :update, :destroy ]
  end

  get 'user/login', to: "user#user_login"
  get 'logout', to: "user#user_logout"
  get 'user/home'
  get 'user/index'
  get 'user/new'
  get 'user/create'
  get 'user/destroy'

  # 2024-08 Demo
  get '/demo/0', to: "demo#demo0"
  get '/demo/1', to: "demo#demo1"

  get 'login', to: redirect("/user/login")
  post 'login', to: "user#post_login"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "home#landing"
  root to: redirect("/businesses")
end
