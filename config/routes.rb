Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:show, :edit, :update] 
  resources :users, only: :show
  resources :items do
    resources :virtual_fittings, only: [:index]
    resources :orders, only: [:index, :create]
  end
end
