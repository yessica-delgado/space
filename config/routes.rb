Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resources :venues, only: [:new, :create]
  end
  resources :venues, only: [:index, :show]
  resources :pages, only: [:home]
end
