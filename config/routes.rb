Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  
  #root to:はサイトのルートページを決める記述
  root to: "public/homes#top" 
  get "about" => "public/homes#about", as: "about"
  
  # devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 会員側のルーティング設定
  # get 'items' => 'public/items#index'
  
  
  
  # 管理者側のルーティング設定
  namespace :admin do #namespaceを適用させている場合、resources :itemsをnamespace :admin do ~ endで囲う
    # get 'items' => 'admin/items#index'
    get "/" => "homes#top"
    resources :items , only:[ :index, :new, :create, :show, :edit, :update]
    resources :orders, only:[ :show]
    resources :customers, only:[ :index, :show, :update, :edit]
    # get 'admin/sing_in' => 'admin/sessions#new'

  end
  #会員のルーティング設定
  scope module: :public do
    # get 'items' => 'public/items#index'
    # customers
    get 'customers/my_page' => 'customers#show', as: "my_page"
    patch 'customers/information' => 'customers#update', as: "information"
    # 退会確認画面
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw', as: "confirm_withdraw"
    patch 'customers/withdraw' => 'customers#withdraw', as: "withdraw"
    get 'customers/information/edit' => 'customers#edit',as: "edit"
    get 'itmes/:id' => 'itemss#show'
    resources :items , only:[ :index, :show]
    resources :orders, only:[ :new, :index, :show]
    post 'orders/log' => 'orders#log'
    get 'orders/thanx' => 'orders#thanx'
    resources :cart_items, only:[ :index, :update, :destroy, :create]
   
  end
  
end
