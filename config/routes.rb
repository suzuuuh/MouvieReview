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
    get 'about'=>'public/homes#about'
    resources :comments, only: [:new, :confirm, :commplete, :index, :show, :edit]
    resources :movies, only: [:index, :show]
    resources :users, only: [:edit, :show]
    get 'comments/new'
    get 'comments/confirm'
    get 'comments/complete'
    get 'comments/index'
    get 'comments/show'
    get 'comments/edit'

    get 'posts/new'
    get 'posts/confirm'
    get 'posts/complete'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
    get 'users/show'
    get 'users/edit'
    get 'users/confirm'
    get 'movies/index'
    get 'movies/show'
    get 'homes/top'
    get 'homes/about'
  end


  namespace :admin do
    root to: "homes#top"
    resources :posts, only: [:show]
    resources :users, only: [:index, :show, :edit, :update]
    resources :movies, only: [:index, :show]

  end


end