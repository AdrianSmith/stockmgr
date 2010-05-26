# == Schema Information
#
# Table name: sales_order_items
#
#  id               :integer(4)      not null, primary key
#  sales_order_id   :integer(4)      not null
#  product_id       :integer(4)      not null
#  quantity         :decimal(12, 3)  default(0.0), not null
#  custom_price     :decimal(8, 2)   default(0.0)
#  use_custom_price :boolean(1)      default(FALSE)
#  created_at       :datetime
#  updated_at       :datetime
#

class SalesOrderItem < ActiveRecord::Base
  belongs_to :sales_order
  belongs_to :product

  validates_presence_of :sales_order, :product, :quantity 

  def cost
    product.cost * quantity
  end

  def price
    if self.use_custom_price
      self.custom_price
    else
      product.price * quantity
    end
  end

end



