Rails.application.routes.draw do
  devise_for :users, controllers:{
    registration: 'users/registrations',
  }
  root to: 'items#index'
  resources :items do
    resources :messages
  end
end
