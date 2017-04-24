Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users

  get '/pages/about' => 'visitors#about'

  resources :posts
end
