Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users
  resources :users, only: [:index, :edit, :update, :show] do
  	resource :follows, only: [:create, :destroy]
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member
  end
  
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  end
  root 'books#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
