class SuppliersController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_order, :only => [:toggle_order_received_status, :toggle_order_paid_status]

  def index
    @suppliers = Supplier.order('name ASC').all
  end

  def toggle_order_received_status
    @order.received = !@order.received?
    @order.paid = true if @order.received?
    @order.save!
    redirect_to(:controller => 'suppliers', :action => 'show', :id => params[:id])
  end

  def toggle_order_paid_status
    @order.paid = !@order.paid?
    @order.save!
    redirect_to(:controller => 'suppliers', :action => 'show', :id => params[:id])
  end

  protected
    def find_order
      @order = PurchaseOrder.find(params[:order_id])
    end
end
