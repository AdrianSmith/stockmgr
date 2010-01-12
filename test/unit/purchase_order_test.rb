require 'test_helper'

class PurchaseOrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end




# == Schema Information
#
# Table name: purchase_orders
#
#  id                 :integer(4)      not null, primary key
#  purchase_order_id  :integer(4)
#  supplier_id        :integer(4)
#  comment            :text
#  is_created         :boolean(1)
#  is_paid            :boolean(1)
#  is_received        :boolean(1)
#  created_by_user_id :integer(4)
#  amount             :decimal(8, 2)   default(0.0)
#  created_at         :datetime
#  updated_at         :datetime
#

