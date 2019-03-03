Rails.application.routes.draw do
  get 'home/index'
  get 'users/index'
  get 'users/new'
  get 'users/destory'
  get 'users/update'
  devise_for :users

  root to: 'home#index'

  resources :users
  resources :posts
end
