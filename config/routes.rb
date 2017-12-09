Rails.application.routes.draw do
  get 'instagrams/index'
  post 'instagrams/upload'

  resources :instagrams
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
