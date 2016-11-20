Rails.application.routes.draw do
  root 'posts#index'
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :show, :update] do
    member do
      get "/edit_password", action: :edit_password
      patch "/edit_password", action: :update_password
    end
    resources :posts, only: [:index], action: :user_posts
    resources :posts, only: [:show]
    resources :comments, only: [:index], action: :user_comments
  end

  resources :posts do
    resources :comments, only: [:new, :create, :edit, :destroy, :update]
    resources :comments, only: [:index], action: :post_comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
