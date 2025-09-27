Rails.application.routes.draw do
  resources :news_posts
  resources :cuisines
  ## TODO way to edit (admin only)
  resources :social_media_sites

  resources :keywords, only: [ :index, :new, :create, :edit, :update, :destroy ]

  get "businesses/:id/edit_gallery", to: "businesses#edit_gallery"
  resources :businesses do
    resources :keywords, only: [ :index, :new, :create, :edit, :update, :destroy ]
    ## TODO consider way to query business_social_media_sites without nested resources? (admin only)
    resources :business_social_media_sites, only: [ :index, :new, :create, :edit, :update, :destroy ]
  end

  get 'user/login', to: "user#user_login"
  get 'logout', to: "user#user_logout"
  get 'user/home'
  get 'user/index'
  get 'user/new'
  get 'user/create'
  get 'user/destroy'

  get 'login', to: redirect("/user/login")
  post 'login', to: "user#post_login"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "home#landing"
  root to: redirect("/businesses")

  # header links
  get '/about-us', to: "home#about_us"
  get '/partner-with-us', to: "home#about_partner_with_us"
  get '/catering-tips', to: "home#about_catering_tips"
  get '/our-partners', to: "home#about_our_partners"
  get '/about-events', to: "home#about_events"
  get '/testimonials', to: "home#about_testimonials"
end
