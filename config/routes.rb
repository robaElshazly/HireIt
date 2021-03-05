Rails.application.routes.draw do
  resources :categories
  resources :items
devise_for :users
 root 'home#page'
end
