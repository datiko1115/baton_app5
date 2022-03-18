Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords', 
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  root to: 'items#index'
  resources :admins, only: [:show]
  resources :users, only: [:show, :edit, :update] 
  resources :users, only: [:show]
  resources :admin_items, only: [:new, :create,]
  resources :items do
    resources :virtual_fittings, only: [:index]
    resources :orders, only: [:index, :create]
  end
end
