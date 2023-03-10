Rails.application.routes.draw do

  root             'static_pages#home'
  
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  get  'signup' => 'users#new'
  

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  #get 'results/show'
  get 'results' => 'results#show'

  resources :users do
    get :select_team, on: :member
    resource :profile, only: [:show, :edit, :update ] 
  end

  resources :teams    #, only: [:show, :index, :update]

  resources :sports 
   #, only: [:show, :index, :update] 
  ###### The function to redirect non admins works but without the full resouces for the links to be available, 
  ###### it just throws routes errors
  
  namespace :admin do
    resources :users do
      resource :profile, only: [:show, :edit, :update ] 
    end
    resources :teams do 
      member do
        get 'captain'
        match 'select_captain'  => 'teams#assign_captain', via: [:patch, :post]
      end
      ##match 'select_captain'  => 'teams#assign_captain', via: [:patch, :post], on: :collection
      ## Doesn't pick specific team due to it's being collection and not member 
    end
    resources :sports do
      #get :medals, on: :member "does the same job as the lines same as below"
      #patch :assign_medal, on: :member "does the same job as the lines same as below"
      member do
        get 'medals'
        match 'assign_medal'  => 'sports#assign_medal', via: [:patch, :post]
        # post 'toggle'
      end
      
      #### Might not be neccesarily needed.
      #resource :gold , only: [:show, :edit, :update ]
      #resource :silver , only: [:show, :edit, :update ]
      #resource :bronze , only: [:show, :edit, :update ]

      end
    end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
