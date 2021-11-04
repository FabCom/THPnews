Rails.application.routes.draw do

  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :cities
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
