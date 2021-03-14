Rails.application.routes.draw do
  
  get 'bookings/new/', to: "bookings#new", as: "new_booking"
  resources :categories
  resources :items
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/my_items' , to: 'users#my_items', as: 'my_items'
  root 'home#page' 
end
