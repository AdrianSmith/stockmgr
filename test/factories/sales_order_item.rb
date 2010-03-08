# == Schema Information
#
# Table name: sales_order_items
#
#  id               :integer(4)      not null, primary key
#  sales_order_id   :integer(4)
#  product_id       :integer(4)
#  quantity         :integer(4)
#  custom_price     :decimal(8, 2)   default(0.0)
#  use_custom_price :boolean(1)      default(FALSE)
#  created_at       :datetime
#  updated_at       :datetime
#

Factory.define :sales_order_item do |i|
  i.product { Product.new(:sale_price => BigDecimal.new("2.50"), :purchase_price => BigDecimal.new("1.50")) }
  i.sales_order { SalesOrder.new }
  i.quantity 100
end





