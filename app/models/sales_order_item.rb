class SalesOrderItem < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :sales_order_id

  belongs_to :sales_order
  belongs_to :product

  validates_presence_of :sales_order, :product, :quantity

  def price
    unit_price * quantity
  end

  def unit_price
    product.sale_price(time)
  end

  def gst
    product.gst_sale_price(time) * quantity
  end

  private

  def time
    if sales_order.invoiced?
      self.sales_order.invoiced_at
    else
      Time.now
    end
  end
end
