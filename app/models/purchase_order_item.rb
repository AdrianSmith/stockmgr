# == Schema Information
#
# Table name: purchase_order_items
#
#  id                :integer(4)      not null, primary key
#  product_id        :integer(4)
#  purchase_order_id :integer(4)
#  quantity          :integer(4)
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







