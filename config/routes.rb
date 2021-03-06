Rails.application.routes.draw do
  resources :boards do
    member do
      post '/comments' => 'boards#create_comment', as: :create_comment_to
      delete '/comments/:comment_id'  => 'boards#delete_comment', as: :delete_comment_to
      patch '/comments/:comment_id' => 'boards#update_comment', as: :update_comment_to
    end

    collection do
      get '/:board_id/like' => 'boards#like_board', as: :user_like
      get '/page_scroll' => 'boards#page_scroll', as: :scroll
    end
  end

  root 'boards#index'

  # sign in as는 패스네이밍을 변경해준다.
  get '/signin' => 'sessions#signin', as: :user_signin # 로그인 페이지
  post '/signin' => 'sessions#user_signin' # 실제 로그인
# sign up
  get '/signup' => 'sessions#signup', as: :user_signup # 회원가입 페이지
  post '/signup' => 'sessions#user_signup' # 실제 회원가입
  post '/check_email' => 'sessions#check_email'
  # sign out
  delete 'signout' => 'sessions#signout', as: :user_signout # 로그아웃

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
