Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  root to: 'items#index'
  resources :items do
  resources :messages, only:[:create, :new, :edit, :update]
  end
end
