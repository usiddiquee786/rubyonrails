Rails.application.routes.draw do
  
  root 'home#index'
  get 'home/about'
  devise_for :users
  resources :friends
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
