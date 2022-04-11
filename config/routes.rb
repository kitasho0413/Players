Rails.application.routes.draw do
  
  
  # 顧客用
devise_for :players,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  scope module: :public do
    resources :players, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :sports, only: [:show]
    get '/' => 'sports#index', as: 'top'
    get '/about' => 'homes#about'
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
