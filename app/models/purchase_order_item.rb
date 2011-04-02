class PurchaseOrderItem < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :product    

  validates_presence_of :product, :purchase_order, :quantity

  def price
    product.purchase_price * quantity
  end
  
  def gst
    product.gst_purchase_price * quantity
  end
  
end
