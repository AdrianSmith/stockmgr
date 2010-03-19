class SalesOrderItemsController < ApplicationController
  def index
    @sales_order_items = SalesOrderItem.all
  end

  def create
    @sales_order = SalesOrder.find(params[:id])
    @sales_order_item = SalesOrderItem.new
    @sales_order_item.sales_order_id = @sales_order.id
    @sales_order_item.product_id = params[:product_id] 
    @sales_order_item.quantity = BigDecimal.new(params[:quantity])

    if @sales_order_item.save
      flash[:notice] = 'SalesOrderItem was successfully created.'
      redirect_to(edit_sales_order_path(@sales_order))
    else
      render :action => "new"
    end
  end

  def destroy
    @sales_order_item = SalesOrderItem.find(params[:id])
    @sales_order = @sales_order_item.sales_order
    @sales_order_item.destroy
    redirect_to edit_sales_order_path(@sales_order)
  end

end
