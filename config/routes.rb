Rails.application.routes.draw do
  root :to => 'public/homes#top'


  namespace :public do
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
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/confirm'
  end
  namespace :public do
    get 'movies/index'
    get 'movies/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end


  namespace :admin do
    root to: "homes#top"
    resources :posts, only: [:show]
    resources :users, only: [:index, :show, :edit, :update]
    resources :movies, only: [:index, :show]

  end


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
end
