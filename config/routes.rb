Rails.application.routes.draw do
  get '/Customers_List', to: "customers#list", as:"customers_list"
  get "/logins/new" => "logins#new", :as => "log_in"
  post "logins" => "logins#create", :as => "create_login"
  get '/logins_show', to: 'logins#show'
  delete '/logout', to: 'logins#destroy'
  get '/post/show/:id', to: 'posts#show', :as => 'show_posts'
  get 'posts', to: 'posts#index', :as => 'posts_list'
  get '/posts', to: 'posts#popup', :as => 'post_popup'
  get '/logins/forgot_password', to: 'logins#forgot_password', :as => 'forgot_password'
  post '/logins/forgot', to: 'logins#forgot'
  get '/logins/password_change', to: 'logins#password_change'
  get '/logins/update', to: 'logins#update'
  put '/logins/proupdate', to: 'logins#proupdate'
  get 'posts:id', to: 'posts#destroy', :as => 'posts_delete'
  get '/customers_profiles', to: 'customers_profiles#show', :as => 'customers_profile'
  get '/customers_profiles', to: 'customers_profiles#index', :as => 'customers_profiles'
  get '/customers_profiles/edit', to: 'customers_profiles#edit', :as => 'edit_customer_profile'
  get '/logins:id', to: 'logins#deactivate', :as => 'deactivate_customer'
  #get '/customers_profiles/:id', to: 'customers_profiles#profile_update', :as => 'profile_update'
  #put '/customers_profiles/:id', to: 'customers_profiles#update' , :as => 'submit_update'
  resources :customers
  resources :logins
  resource  :posts
  resource :customers_profiles
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'customers#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
