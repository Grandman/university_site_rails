Rails.application.routes.draw do
  resources :news
  get 'nir/', to: 'news#index', category: '2'
  get 'nirs/', to: 'news#index', category: '3'
  devise_for :users
  root to: "static_pages#show", id: 'index'
  resources :users
  resources :comments
  resources :news
  resources :disciplines
  get '/moderations', to: 'moderations#index'
  get '/elfinder_manager', to: 'elfinder#index'
  match 'elfinder' => 'elfinder#elfinder', via: [:get, :post]
  post '/moderations/:user_id', to: 'moderations#create', as: :moderation
  post '/users/teacher', to: 'users#teacher', as: :new_teacher
  get '/pages/:id', to: 'static_pages#show'
  get '/static_pages/edit/*id' , to: 'static_pages#edit', as: :edit_static_page, id: %r{([a-z0-9_]+/*)+}
  get '/static_pages/new' , to: 'static_pages#new', as: :new_static_page
  get '/static_pages/*id' , to: 'static_pages#show', as: :static_page, id: %r{([a-z0-9_]+/*)+}
  put '/static_pages/*id' , to: 'static_pages#update', id: %r{([a-z0-9_]+/*)+}
  patch '/static_pages/*id' , to: 'static_pages#update', id: %r{([a-z0-9_]+/*)+}
  delete '/static_pages/*id' , to: 'static_pages#destroy', id: %r{([a-z0-9_]+/*)+}
  get '/static_pages/' , to: 'static_pages#index', as: :static_pages
  post '/static_pages/' , to: 'static_pages#create'
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
