Rails.application.routes.draw do
  
  root to: 'homepages#index'
  
  resources :users, only:[:show, :index, :destroy]
  get "/auth/github", as: "github_login"
  get "/auth/:provider/callback", to: "users#create"
  delete "/logout", to: "users#destroy", as: "logout"

  resources :products, except: :destroy
end
