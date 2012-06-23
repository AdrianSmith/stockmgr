class SalesOrderItem < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :sales_order_id
end
