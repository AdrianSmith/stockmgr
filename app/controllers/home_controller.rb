class HomeController < ApplicationController
  def index
    @number_of_customers = Customer.count
    @number_of_products = Product.count

    @unpaid_sales_orders = SalesOrder.where(:paid => false).order('invoiced_at DESC').limit(5)

    @total_sales = SalesOrder.all.inject(0){|sum, o| sum + o.total_price}
    @total_payments = Payment.all.inject(0){|sum, o| sum + o.amount}
    @balance = @total_payments - @total_sales
  end
end
