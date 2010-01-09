class SalesOrder < ActiveRecord::Base
end

# == Schema Information
#
# Table name: sales_orders
#
#  id                   :integer(4)      not null, primary key
#  user_id              :integer(4)
#  comment              :text
#  created_by_user_id   :integer(4)
#  sales_order_state_id :integer(4)
#  is_invoiced          :boolean(1)
#  invoice_amount       :integer(10)
#  invoiced_at          :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

