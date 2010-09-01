class WelcomeController < ApplicationController
	
  def index
    @customers_count = User.count(:all, :conditions => ["is_customer = ?", true])
    @suppliers_count = Supplier.count(:all)
    @products_count = Product.count(:all)
  end
  
end
