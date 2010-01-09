class PurchaseOrder < ActiveRecord::Base
end


# == Schema Information
#
# Table name: purchase_orders
#
#  id                      :integer(4)      not null, primary key
#  supplier_id             :integer(4)
#  comment                 :text
#  created_by_user_id      :integer(4)
#  purchase_order_state_id :integer(4)
#  amount                  :decimal(8, 2)   default(0.0)
#  created_at              :datetime
#  updated_at              :datetime
#

