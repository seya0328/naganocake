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
    
    resources :items , only:[ :index, :new, :create, :show, :edit, :update]
    
    # get 'admin/sing_in' => 'admin/sessions#new'

  end
  
  scope module: :public do
    # get 'items' => 'public/items#index'
    get 'customers/my_page' => 'customers#show', as: "my_page"
    resources :items , only:[ :index, :show]
    resources :customers, only:[ :edit, :update, :confirm_with, :withdraw]
  end
  
end
