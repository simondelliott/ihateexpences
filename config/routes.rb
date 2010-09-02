ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  
#       users GET    /users(.:format)                   {:action=>"index", :controller=>"users"}
#             POST   /users(.:format)                   {:action=>"create", :controller=>"users"}
#    new_user GET    /users/new(.:format)               {:action=>"new", :controller=>"users"}
#   edit_user GET    /users/:id/edit(.:format)          {:action=>"edit", :controller=>"users"}
#        user GET    /users/:id(.:format)               {:action=>"show", :controller=>"users"}
#             PUT    /users/:id(.:format)               {:action=>"update", :controller=>"users"}
#             DELETE /users/:id(.:format)               {:action=>"destroy", :controller=>"users"}

  map.new_user  '/users/new',             :controller => 'users', :action => "new"
  map.edit_user '/users/:username/edit',  :controller => 'users', :action => "edit",    :username => /[a-zA-Z0-9]+/
  map.connect   '/users/:username',       :controller => 'users', :action => "destroy", :username => /[a-zA-Z0-9]+/, :conditions => { :method => :delete }
  map.connect   '/users/:username',       :controller => 'users', :action => "update",  :username => /[a-zA-Z0-9]+/, :conditions => { :method => :put }
  map.user      '/users/:username',       :controller => 'users', :action => "show",    :username => /[a-zA-Z0-9]+/
  map.connect   '/users',                 :controller => "users", :action => "create", :conditions => { :method => :post }
  map.users     '/users',                 :controller => "users", :action => "index"


  map.new_expence  '/users/:username/expences/new',    :controller => 'expences', :action => "new",  :username => /[a-zA-Z0-9]+/
  map.expence      '/users/:username/expences/:id',    :controller => 'expences', :action => "show", :username => /[a-zA-Z0-9]+/, :id => /[0-9]/
  map.connect      '/users/:username/expences',        :controller => 'expences', :action => "create", :username => /[a-zA-Z0-9]+/, :conditions => { :method => :post }
  map.expences     '/users/:username/expences',        :controller => 'expences', :action => "index", :username => /[a-zA-Z0-9]+/
  #map.resources :expences

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => "home" 

end
