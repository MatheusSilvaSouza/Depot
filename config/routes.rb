Rails.application.routes.draw do
  resources :itens_groups
  resources :carts
  get 'store/index', as: :catalog

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
