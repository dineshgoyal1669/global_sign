Rails.application.routes.draw do
  root 'crypto_currencies#index'

  resource :crypto_currencies, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get 'users', to: 'users#sign_up'
  get 'users/password', to: 'users/password#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
