Rails.application.routes.draw do
  
  resources :categories
  resources :items
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/my_items' , to: 'users#my_items', as: 'my_items'
  root 'home#page' 
end
