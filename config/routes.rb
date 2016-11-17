Rails.application.routes.draw do
  root 'posts#index' 
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit]

  resources :posts

  resource :comments, only: [:new, :create, :edit, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
