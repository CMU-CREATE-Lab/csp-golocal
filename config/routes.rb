Rails.application.routes.draw do
  # Define your application routes per the DSL:
  # https://guides.rubyonrails.org/routing.html

  # NOTE: matches the **first route that fits** (so put specific routes before general ones)

  ###########################################################
  # 📌 ROOT PATH
  ###########################################################

  # Defines the root path route ("/")
  #root "home#landing"
  root to: redirect("/businesses")

  ###########################################################
  # 📚 DB MODELS
  ###########################################################

  # `resources :modelname` will generate 7 RESTful routes by default:
  # [ :index, :show, :new, :create, :edit, :update, :destroy ]

  get '/managed_files/filename/:name', to: 'managed_files#show_from_filename'
  get '/managed_files/stream/:name', to: 'managed_files#show_from_stream'
  resources :managed_files

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

  ###########################################################
  # 🔑 USER AUTHENTICATION & ACCOUNT MANAGEMENT
  ###########################################################

  get 'user/login', to: "user#user_login"
  get 'logout', to: "user#user_logout"
  post 'login', to: "user#post_login"

  resources :user, only: [ :index, :new, :create, :destroy ] do
    collection do
      # '/user/home' → user#home
      get 'home'
    end
  end

  get 'login', to: redirect("/user/login")

  namespace :admin do
    #root to: "admin#index"
    controller :home do
      get '/', action: 'index', as: 'index'
    end
    # ...
    resources :managed_files, path: 'files', only: [ :index, :edit, :destroy ], as: 'files'
    resources :news_posts, path: 'news', only: [ :index ], as: 'news'
    #resources :businesses, path: 'businesses', only: [ :index ], as: 'businesses'
    controller :businesses do
      get 'businesses', action: 'index', as: 'businesses'
      get 'businesses/social_media_sites', action: 'social_media_sites', as: 'businesses/social_media_sites'
      get 'businesses/keywords', action: 'keywords', as: 'businesses/keywords'
      get 'businesses/cuisines', action: 'cuisines', as: 'businesses/cuisines'
    end
  end

  ###########################################################
  # ℹ️ ABOUT PAGES (Static + Dynamic + News)
  ###########################################################

  namespace :about do
    # about_news_posts_path -> (as: 'news') -> about_news_index_path, about_news_path(id)
    resources :news_posts, path: 'news', only: [ :index, :show ], as: 'news'
  end

  scope :about do
    get '/', to: redirect('/about/about_us')
    # Static about pages
    %w[about_us about_join_golocal about_catering_tips about_our_partners about_testimonials].each do |page|
      # NOTE: you can also explicitly route from a namespace (e.g. /about#show)
      get page, to: "about##{page}", as: page.to_sym
    end
  end

  ## Alternative for About::PagesController (pages#show pattern, app/views/about/pages/:page)
  # namespace :about do
  #   get '/:page', to: 'pages#show', as: :page
  # end

  ###########################################################
  # 🧪 MISC / DEV ROUTES (Examples, experiments, etc.)
  ###########################################################

  # -- Miscellaneous Rails routes features

  ## Concerns (declare common routes that can be reused inside other resources)
  ## https://guides.rubyonrails.org/routing.html#routing-concerns

  ## Wildcard/Globbing
  ## https://guides.rubyonrails.org/routing.html#wildcard-segments
  # # matches any path after `/files/` as `params[:path]`
  # get 'files/*path', to: 'files#show'

  ## Constraints
  ## https://guides.rubyonrails.org/routing.html#segment-constraints
  ## define advanced constraints by class: https://guides.rubyonrails.org/routing.html#advanced-constraints

  ## Subdomains
  # constraints subdomain: 'admin' do
  #   #put all your subdomain routes in this block
  #   #get '/', "admin#index"
  # end
  # # domain or full hostname: `constraints(host: 'admin.example.com') do `
  ## NOTE: You can use `root` inside constraints (but avoid `root_path` collisions by using `as:`)
  ## top level domain treated as last 2 parts by default, or you can update environment.rb:
  # # e.g. `foo.bar.example.co.uk` is `foo.bar`(subdomain) + `example.co.uk`(domain)
  # config.action_dispatch.tld_length = 3

  ## Inspecting Routes
  ## https://guides.rubyonrails.org/routing.html#inspecting-routes
  ## Web (127.0.0.1:3000/rails/info/routes)
  ## CMD Line (`rails routes`)
  ## Rails Console/irb> Rails.application.routes.url_helpers.users_path

  ## (Shouldn't Do This, But...) Breaking Up Large Route Files with `draw(:filename)`
  ## https://guides.rubyonrails.org/routing.html#breaking-up-a-large-route-file-with-draw
  ## needs to be located inside the config/routes directory or any sub-directory
  ## (e.g. config/routes/admin.rb or config/routes/external/admin.rb).

  # --

  ## RUBYGEMS: rails_admin, administrate
  ## leaving notes on these, but I don't recommend using.
  #
  ## ... (from Gemfile):
  # # after install: `rails g rails_admin:install`
  # # (also removed rails_admin.scss)
  # gem "rails_admin"
  # # after install: `rails g administrate:install`
  # gem "administrate"
  ## ... (routes)
  # if Rails.env.development?
  #   ## (not necessary to include for rails_db gem)
  #   #mount RailsDb::Engine => '/rails/db', as: 'rails_db'
  #
  #   #Administrate or RailsAdmin or ActiveAdmin
  #   ## ignore for now (requires sass build and SCSS changes)
  #   ##mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  #   namespace :admin do
  #     # Administrate dashboard routes
  #     Administrate::Engine.routes
  #   end
  # end

  ## Example legacy route for the home controller
  #get '/about-events', to: "home#about_events"
end
