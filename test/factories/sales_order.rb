# == Schema Information
#
# Table name: sales_orders
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  comment            :text
#  created_by_user_id :integer(4)
#  is_ordered         :boolean(1)
#  is_invoiced        :boolean(1)
#  is_paid            :boolean(1)
#  invoice_amount     :decimal(8, 2)   default(0.0)
#  invoiced_at        :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

Factory.define :sales_order do |o|
  o.is_invoiced true
  o.is_paid true
  o.invoice_amount
  o.created_at {DateTime.now}
end
