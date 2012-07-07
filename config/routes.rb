Prodmgr::Application.routes.draw do

  resources :products

  resources :product_types

  resources :product_prices

  resources :payments

  resources :payment_types

  resources :customers do
    member do
      put 'toggle_order_invoiced_status'
      put 'toggle_order_paid_status'
    end
  end

  devise_for :users

  resources :sales_orders do
    member do
      get 'invoice_pdf'
      put 'add_basket_item'
      put 'add_sales_order_item'
      delete 'remove_basket_item'
      delete 'remove_sales_order_item'
    end
  end
  resources :sales_order_items

  resources :suppliers

  root :to => 'home#index'
end
