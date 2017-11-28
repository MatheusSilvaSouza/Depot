# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :itens_groups
  resources :carts
  resources :products

  get 'store/index', as: :catalog
  root 'store#index'
end
