Rails.application.routes.draw do
  get 'user/login'
  get 'user/logout'
  get 'user/home'
  get 'user/index'
  get 'user/new'
  get 'user/create'
  get 'user/destroy'
  resources :temp_businesses

  get "old/temp_businesses", to: "temp_businesses#index_default"
  get "old/temp_businesses/:id", to: "temp_businesses#show_default"

  get 'home/demo1'
  get 'home/demo2'
  get 'home/demo3', to: "temp_businesses#demo3"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#landing"
end
