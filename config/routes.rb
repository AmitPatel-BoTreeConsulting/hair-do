Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hairstyles do
  resources :comments, only: [:new, :create]
  resources :saved_hairstyles, only: [:new, :create]
end

  resources :saved_recipes, only: :destroy
  resources :comments, only: :destroy
  resources :hairdresers
end
