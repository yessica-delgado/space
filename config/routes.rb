Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users
  resources :venues, only: [:index, :show, :new, :create]
  resources :pages, only: [:home]
end
