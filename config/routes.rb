Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users

  resources :venues, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [ :new, :create ]
    resources :bookings, only: [ :index, :new, :create, :show]
  end
  resources :pages, only: [:home]
  resources :reviews, only: [ :destroy ]

end
