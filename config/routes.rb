Rails.application.routes.draw do
  root :to => 'public/homes#top'

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    get 'about'=>'homes#about'
    resources :movies, only: [:index, :show]
    get 'users/confirm' => 'users/confirm'
    patch 'users/withdraw' => 'users/withdraw', as: :user_withdraw
    resources :users, only: [:edit, :show, :update]


    resources :posts do
      resources :comments, only: [:new, :index, :show, :edit, :create]
      post 'commennts/confirm' => 'commennts/confirm'
      get 'comments/complete'
    end
    get 'posts/complete'

    get 'users/show'
    get 'users/edit'
    get 'users/confirm'


  end


  namespace :admin do
    root to: "homes#top"
    resources :posts
    resources :users, only: [:index, :show, :edit, :update]
    resources :movies

  end

  get "search" => "searches#search"


end