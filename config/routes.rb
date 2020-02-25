Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  root to: 'items#index'
  resources :users 

  resources :items do
    resources :messages, only:[:new, :create]
    resources :orders, only:[:new, :create]
  end
end
 