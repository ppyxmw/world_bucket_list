Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: [:show, :index] do
    resources :destinations, only: [:new, :create, :index] 
  end
  resources :destinations do
    resources :todos, only: [:new, :create, :show]
  end
end
