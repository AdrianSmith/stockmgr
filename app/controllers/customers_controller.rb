class CustomersController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_order, :only => [:toggle_order_invoiced_status, :toggle_order_paid_status]

  def index
    @customers = Customer.includes(:sales_orders, :payments ).ordered_by_last_name
  end

  def toggle_order_invoiced_status
    @order.update_invoice_time unless @order.invoiced?
    @order.invoiced = !@order.invoiced?
    @order.save!
    redirect_to(:controller => 'customers', :action => 'show', :id => params[:id])
  end

  def toggle_order_paid_status
    @order.paid = !@order.paid?
    @order.update_invoice_time unless @order.invoiced?
    @order.invoiced = true if @order.paid?
    @order.save!
    redirect_to(:controller => 'customers', :action => 'show', :id => params[:id])
  end

  protected
    def find_order
      @order = SalesOrder.find(params[:order_id])
    end

end
