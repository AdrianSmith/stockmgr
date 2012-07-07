class SalesOrderItemsController < InheritedResources::Base
  actions :index, :show, :destroy
  before_filter :authenticate_user!

  def destroy
    @sales_order_item = SalesOrderItem.find(params[:id])
    @sales_order = @sales_order_item.sales_order
    @sales_order_item.destroy
    redirect_to edit_sales_order_path(@sales_order)
  end
end
