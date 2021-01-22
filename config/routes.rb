Rails.application.routes.draw do
  devise_for :users

  root to: "products#index"


  resources :users
  resources :products, only: [:index, :edit, :new, :show, :create, :update]
end