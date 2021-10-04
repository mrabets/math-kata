Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :tasks do
    resources :comments do
      resources :likes, only: [:create, :destroy]
    end
    resources :ratings
  end

  post '/tasks/:id', to: 'tasks#answer'
  put '/tasks/:id', to: 'tasks#answer'

  scope "(:locale)", locale: /en|ru/ do
    root to: 'pages#home'
    resources :users, :only =>[:show]
    devise_for :users, :path_prefix => 'd', skip: :omniauth_callbacks
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'    
    get 'admin' => 'admin#home'
  end
end
