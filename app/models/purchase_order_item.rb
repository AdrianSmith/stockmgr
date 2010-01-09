class PurchaseOrderItem < ActiveRecord::Base
end


# == Schema Information
#
# Table name: purchase_order_items
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)
#  quantity   :integer(10)
#  price      :decimal(8, 2)   default(0.0)
#  created_at :datetime
#  updated_at :datetime
#

