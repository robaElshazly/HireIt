Rails.application.routes.draw do
  resources :categories
  resources :items
 # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#page' 
end
