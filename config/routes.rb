Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :virtual_fittings, only: [:index]
    resources :orders, only: [:index, :create]
  end
end
