Rails.application.routes.draw do
  
  root to: 'homepages#index'
  
  resources :users, only:[:show, :index, :destroy]
  get "/auth/github", as: "github_login"
  get "/auth/:provider/callback", to: "users#create", as: "auth_callback"
  delete "/logout", to: "users#destroy", as: "logout"
  
  resources :products, except: :destroy do
    resources :order_items, only: [:new, :create]
  end
  resources :categories, except: :destroy
  
  resources :orders do
    resources :order_items, only: [:edit, :update, :destroy]
  end
end
