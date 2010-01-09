require 'test_helper'

class SalesOrderItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: sales_order_items
#
#  id                  :integer(4)      not null, primary key
#  sales_order_id      :integer(4)
#  product_id          :integer(4)
#  quantity            :integer(10)
#  percentage_discount :integer(4)
#  price               :decimal(8, 2)   default(0.0)
#  created_at          :datetime
#  updated_at          :datetime
#

