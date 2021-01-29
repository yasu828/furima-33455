Rails.application.routes.draw do
  get 'users/show'
  get 'cards/new'
  get 'addresses/new'
  get 'buydata/new'
  devise_for :users

  root to: "products#index"


  resources :products do
    resources :addresses
  end
  resources :buydata
end