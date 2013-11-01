Devkit::Application.routes.draw do

  root :to => "home#index"

  devise_for :users, :controllers => { :sessions => "admin/sessions" }
  # old scope doesn't work with devise's sessions
  # scope "/admin" do
  #   devise_for :users
  # end

  # admin backend
  namespace :admin do
    get "", to: "dashboard#index"
    resources :users
    resources :codes, :path => "/code/"
      post "codes/preview", to: "codes#preview"
      patch "codes/preview", to: "codes#preview"
    resources :tools
    resources :blog_posts
  end


  # Tools route
  get "/tools/tags/:tag", to: "tools#index", as: :tool_tag
  resources :tools do
    # Tool docs
    resources :docs
  end


  # code snippets tags routes
  get "/code/tags/*tag", to: "codes/tags#index", as: :code_tag, :trailing_slash => false
  get '/code/tags', to: redirect('/code/')

  # Code method path
  post "/code/preview", to: "admin/codes#preview"

  # Code resource
  resources :codes , :path => "/code/" do
    # Show raw code
    get "/raw/", :to => "codes/raw#show"
    # Download code path
    member do
      get :download
    end
  end


  #blog
  resources :blog_posts, :path => "blog"

  # single google search page
  get "/search" => "search#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
