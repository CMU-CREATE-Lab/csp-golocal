Rails.application.routes.draw do
  resources :temp_businesses
  get 'home/demo1'
  get 'home/demo2'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
