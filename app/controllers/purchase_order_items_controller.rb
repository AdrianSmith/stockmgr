class PurchaseOrderItemsController < ApplicationController

  def index
    @purchase_order_items = PurchaseOrderItem.all
  end

  def create
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order_item = PurchaseOrderItem.new
    @purchase_order_item.purchase_order_id = @purchase_order.id
    @purchase_order_item.product_id = params[:product]
    @purchase_order_item.quantity = BigDecimal.new(params[:quantity]) 

    if @purchase_order_item.save
      flash[:notice] = 'PurchaseOrderItem was successfully created.'
      redirect_to(edit_purchase_order_path(@purchase_order))
    else
      flash[:notice] = 'PurchaseOrderItem was NOT created.'
      redirect_to(edit_purchase_order_path(@purchase_order))
    end
  end

  def destroy
    @purchase_order_item = PurchaseOrderItem.find(params[:id])
    @purchase_order = @purchase_order_item.purchase_order
    @purchase_order_item.destroy
    redirect_to edit_purchase_order_path(@purchase_order)
  end

end
