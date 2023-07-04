Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 会員側のルーティング設定
  get 'items' => 'public/items#index'
  
  
  
  # 管理者側のルーティング設定
  namespace :admin do #namespaceを適用させている場合、resources :itemsをnamespace :admin do ~ endで囲う
    get 'items' => 'admin/items#index'
    
    resources :items
  end
end
