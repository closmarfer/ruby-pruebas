Rails.application.routes.draw do

  

  get 'productos/contacto'
  post 'productos/contacto'

  get 'productos/quienes_somos'

  resources :productos
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root "productos#index"

  #Páginas estáticas
  get "quienes-somos" => "productos#quienes_somos", :as => "quienes_somos"
  get "contacto" => "productos#contacto", :as => "contacto"
  post "contacto" => "productos#contacto", :as => "contacto_post"
  post "anadir-producto" => "productos#anadir_carrito"

  get "carrito" => "productos#ver_carrito", :as => "carro"
  get "vaciar_carrito" => "productos#vaciar_carrito", :as => "vaciar_carro"

  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :productos
  end

  get 'admin/*other' => redirect('/admin/productos/')
  get '*other' => redirect('/')

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
