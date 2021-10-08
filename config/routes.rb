Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :tasks do
    resources :comments do
      member do
        put "like", to: "comments#like"
        put 'dislike', to: 'comments#dislike'
      end
    end
    resources :ratings
  end

  post '/tasks/:id', to: 'tasks#answer'
  put '/tasks/:id', to: 'tasks#answer'

  resources :users do
     member do
      match 'search' => 'users#search', via: [:get, :post], as: :search
    end
  end

  scope "(:locale)", locale: /en|ru/ do
    root to: 'pages#home'  
    devise_for :users, :path_prefix => 'd', skip: :omniauth_callbacks
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'    
    get 'admin' => 'admin#home'
  end
end
