Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  root to: 'items#index'
  resources :users
  resources :items do
    member do
      get :order 
    end
    resources :messages, only:[:create, :new]



  end

  # resources :cards 
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      # post 'delete', to: 'card#delete'
    end
  end


end
 