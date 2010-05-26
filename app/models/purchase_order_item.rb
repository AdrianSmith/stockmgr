# == Schema Information
#
# Table name: purchase_order_items
#
#  id                :integer(4)      not null, primary key
#  product_id        :integer(4)      not null
#  purchase_order_id :integer(4)      not null
#  quantity          :decimal(12, 3)  default(0.0), not null
#  created_at        :datetime
#  updated_at        :datetime
#

class PurchaseOrderItem < ActiveRecord::Base 
  belongs_to :purchase_order
  belongs_to :product    

  validates_presence_of :product, :purchase_order, :quantity

  def cost
    product.cost * quantity
  end

  def price
    product.price * quantity
  end

end







