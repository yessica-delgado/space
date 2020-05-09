Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users

  resources :venues, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [ :new, :create ]
    resources :bookings, only: [ :new, :create ]
  end
  resources :pages, only: [:home]
  resources :reviews, only: [ :destroy ]
  resources :bookings, only: [ :index]

end
