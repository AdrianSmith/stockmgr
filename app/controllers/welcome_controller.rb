class WelcomeController < ApplicationController
	
  def index
    @customers_count = User.count(:all)
    @suppliers_count = Supplier.count(:all)
    @products_count = Product.count(:all)
    @purchase_orders_count = PurchaseOrder.count(:all)
    @sales_orders_count = SalesOrder.count(:all)    
  end
  
end
