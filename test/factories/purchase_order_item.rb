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

Factory.define :purchase_order_item do |i|
  i.product { Product.new(:sale_price => BigDecimal.new("2.50"), :purchase_price => BigDecimal.new("1.50")) }
  i.purchase_order { PurchaseOrder.new }
  i.quantity 100
end





