Rails.application.routes.draw do
  resources :temp_businesses

  get "old/temp_businesses", to: "temp_businesses#index_default"
  get "old/temp_businesses/:id", to: "temp_businesses#show_default"

  get 'home/demo1'
  get 'home/demo2'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
