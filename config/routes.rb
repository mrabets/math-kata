Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/users/:id', to: 'users#show'

    resources :users, :only =>[:show]
  scope "(:locale)", locale: /en|ru/ do
    devise_for :users, :path_prefix => 'd', skip: :omniauth_callbacks

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    
    root to: 'pages#home'

    get 'admin' => 'admin#home'

    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
