Rails.application.routes.draw do
  
  
  
  # 顧客用
devise_for :players,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  scope module: :public do
    get 'players/unsubscribe' => 'players#unsubscribe', as: 'unsubscribe'
    get 'players/withdraw'
    patch 'players/withdraw'
    resources :players, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :sports, only: [:show]
    resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]
    get '/' => 'sports#index', as: 'top'
    get '/about' => 'homes#about'
    get "search" => "searches#search"
    get 'search_result' => "searches#search_result"
  end

  
# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    resources :sports, only: [:new, :create, :index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
