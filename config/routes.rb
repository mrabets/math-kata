Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope "(:locale)", locale: /en|ru/ do
    devise_for :users, skip: :omniauth_callbacks

    get 'users/show'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    
    root to: 'pages#home'

    get 'admin' => 'admin#home'

    resources :users, :only =>[:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
