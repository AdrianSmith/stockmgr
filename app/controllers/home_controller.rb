class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @number_of_certifiers = Certifier.count
    @number_of_payment_types = PaymentType.count
    @number_of_physical_forms = PhysicalForm.count
    @number_of_product_types = ProductType.count
    @number_of_storage_locations = StorageLocation.count
    @number_of_storage_types = StorageType.count
    @number_of_units_of_measures = UnitsOfMeasure.count

    @number_of_suppliers = Supplier.count
    @number_of_customers = Customer.count
    @number_of_products = Product.count
    
    @unpaid_sales_orders = SalesOrder.where(:paid => false).order('invoiced_at DESC').all
    @total_unpaid = @unpaid_sales_orders.inject(0){|sum, o| sum + o.total_price}
    
    @total_sales = SalesOrder.all.inject(0){|sum, o| sum + o.total_price}
    @total_payments = Payment.all.inject(0){|sum, o| sum + o.amount}
    @balance = @total_payments - @total_sales
  end

end
