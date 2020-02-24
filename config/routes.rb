Rails.application.routes.draw do
  devise_for :users, controllers:{
    registration: 'users/registrations',
  }
  root to: 'items#index'
  resources :users
  resources :items do
    member do
      get :order 
    end
    resources :messages, only:[:create, :new]

  

  #

  end


  # resources :cards 
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      # post 'delete', to: 'card#delete'
    end
  end


end
