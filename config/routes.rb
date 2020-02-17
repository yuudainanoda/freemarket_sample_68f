Rails.application.routes.draw do
  devise_for :users, controllers:{
    registration: 'users/registrations',
  }
  # devise_scope :user do
  #   get 'telephones', to:'users/registrations#new_telephone'
  #   post 'telephones', to: 'users/registrations#create_telephone'
  # end
  # devise_for :users
  root to: 'items#index'
end
