Rails.application.routes.draw do
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root to: 'pages#home'

  get 'admin' => 'admin#home'

  resources :users, :only =>[:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
