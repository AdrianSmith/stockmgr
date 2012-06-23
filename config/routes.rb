Prodmgr::Application.routes.draw do

  resources :suppliers

  resources :sales_order_items

  resources :sales_orders

  resources :products

  resources :product_types

  resources :product_prices

  resources :payments

  resources :payment_types

  resources :customers

  devise_for :users

  root :to => 'home#index'
end
