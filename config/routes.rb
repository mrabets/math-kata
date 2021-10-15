Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope '(:locale)', locale: /en|ru/ do
    root to: 'pages#home'
    devise_for :users, path_prefix: 'd', skip: :omniauth_callbacks

    resources :users do
      member do
        match 'search' => 'users#search', via: %i[get post], as: :search
      end
    end

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    get 'admin' => 'admin#home'

    resources :tasks do
      resources :comments do
        member do
          put 'like', to: 'comments#like'
          put 'dislike', to: 'comments#dislike'
        end
      end
      resources :ratings
    end

    get 'tags/:tag', to: 'tasks#index', as: :tag
    get 'subjects/:subject', to: 'tasks#index', as: :subject

    post '/tasks/:id', to: 'tasks#answer'
  end
end
