UpbEmergencies::Application.routes.draw do

  devise_for :system_users, :path_prefix => 'd' do
    get 'logout' => 'devise/sessions#destroy'
    get 'admin' => 'devise/sessions#new'
  end
  get "locations/load_location"
  match "emergencies/show_code" => "emergencies#show_code"
  match "resources_zones/resources_loader" => "resources_zones#resources_loader"
  match "home/help" => "home#help"
  match "home/upb_emergencies_about" => "home#upb_emergencies_about"
  match "home/index" => "home#index"
  match "emergencies/cancel" => "emergencies#cancel"
  match "system_users/password/" => "system_users#password"
  match "system_users/reset_password/" => "system_users#reset_password"
  match "reported_emergency", :controller => "emergencies", :action => "reported_emergency", :as => "reported_emergency"
  match "edit_state_emergency", :controller => "emergencies", :action => "edit_state_emergency", :as => "edit_state_emergency"
  
  resources :system_users

  resources :emergencies

  resources :neighborhoods do 
    get :autocomplete_neighborhood_name, :on => :collection
  end

  get "dashboard/index"


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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
