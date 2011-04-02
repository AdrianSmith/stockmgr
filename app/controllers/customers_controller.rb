class CustomersController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def index
    @customers = Customer.order('last_name ASC').all
  end
  
  def toggle_order_invoiced_status
    order = SalesOrder.find(params[:order_id])
    order.update_invoice_time unless order.invoiced?
    order.invoiced = !order.invoiced?
    order.save!
    redirect_to(:controller => 'customers', :action => 'show', :id => params[:id])
  end

  def toggle_order_paid_status
    order = SalesOrder.find(params[:order_id])
    order.paid = !order.paid?
    order.update_invoice_time unless order.invoiced?
    order.invoiced = true if order.paid?
    order.save!
    redirect_to(:controller => 'customers', :action => 'show', :id => params[:id])
  end
  
end
