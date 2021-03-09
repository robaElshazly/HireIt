Rails.application.routes.draw do
  get 'users/show'
  resources :categories
  resources :items
 # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, :only=> [:show]
  root 'home#page' 
end
