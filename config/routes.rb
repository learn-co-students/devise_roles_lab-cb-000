Rails.application.routes.draw do
    devise_for :users, controllers: {
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'sessions'
    }

  get '/home', to: 'welcome#home'

  root to: 'users#index'

  resources :users
  resources :posts
end
