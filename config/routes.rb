ILEA::Application.routes.draw do
  
  resources :teachers


  resources :part_dbs
  resources :videos

  get "present_intro/present"

  get "rhino/donate"

  get "rhino/answers"

  get "rhino/university"

  get "title/end"
  get "title/one"
  match '/task1' => "title#one"
  
  get "title/two"
  match '/task2' => "title#two"
  
  get "title/three"
  match '/task3' => "title#three"
  
  get "title/four"
  match '/task4' => "title#four"
  
  get "title/five"
  match '/task5' => "title#five"
  
  get"title/home"




  resource :session
  match '/logout' => "sessions#destroy", :as => "logout"
  resources :users do
  resources :information
  resources :research_as  
  resources :research_bs 
  resources :research_cs
  resources :websites
  resources :present_titles
  resources :questionnaires
  resources :feedbacks
  
  resources :part_scores do
     get 'page/:page', :action => :create, :on => :collection
  end
   resources :video_scores do
     get 'page/:page', :action => :create, :on => :collection
  end 
  
end
 
root to: 'title#home'

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


  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
