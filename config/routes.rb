Rails.application.routes.draw do
  namespace :public do
    get 'comments/new'
    get 'comments/confirm'
    get 'comments/complete'
    get 'comments/index'
    get 'comments/show'
    get 'comments/edit'
  end
  namespace :public do
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
    get 'posts/show'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'movies/index'
    get 'movies/show'
  end
  namespace :admin do
    get 'homes/top'
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
