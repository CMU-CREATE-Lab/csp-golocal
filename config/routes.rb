Rails.application.routes.draw do
  resources :keywords, only: [ :index, :new, :create, :edit, :update, :destroy ]

  get "businesses/:id/edit_gallery", to: "businesses#edit_gallery"
  resources :businesses

  get 'user/login', to: "user#user_login"
  get 'logout', to: "user#user_logout"
  get 'user/home'
  get 'user/index'
  get 'user/new'
  get 'user/create'
  get 'user/destroy'

  get 'login', to: redirect("/user/login")
  post 'login', to: "user#post_login"

  resources :temp_businesses

  get "old/temp_businesses", to: "temp_businesses#index_default"
  get "old/temp_businesses/:id", to: "temp_businesses#show_default"

  get 'home/demo1'
  get 'home/demo2'
  get 'home/demo3', to: "temp_businesses#demo3"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "home#landing"
  get 'landing', to: "home#landing"
  root to: redirect("/businesses")
end
