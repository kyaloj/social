Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :image_posts
  resources :text_posts
  resources :users
  resources :sessions
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  root to: 'posts#index'

  namespace :api do
    resources :posts
    resources :text_posts
  end
end
