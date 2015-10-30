Rails.application.routes.draw do

  get 'customer/index'

  get 'doctor/index'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :appointments
  resources :pet_types
  resources :pets
  resources :profiles
  resources :doctor
  resources :customer

  scope "/admin" do
    resources :users
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  authenticated :user, ->(u) { u.admin?} do
    root to: "profiles#index", as: :admin_root
  end


  authenticated :user, ->(u) { u.receptionist?} do
    root :to => 'appointments#index', as: :authenticated_root
  end

  authenticated :user, ->(u) { u.doctor?} do
    root :to => 'doctor#index', as: :doctor_root
  end

  authenticated :user, ->(u) { u.customer?} do
    root :to => 'customer#index', as: :customer_root
  end
  root :to => 'welcome#index'

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
