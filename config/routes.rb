Rails.application.routes.draw do
  
  resources :categories
  resources :items
 # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
 # get 'users/show', to: edit_user_registration_path 
  root 'home#page' 
end
