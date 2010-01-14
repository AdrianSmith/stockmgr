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
#  invoice_amount     :integer(10)
#  invoiced_at        :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

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
#  invoice_amount     :integer(10)
#  invoiced_at        :datetime
#  created_at         :datetime
#  updated_at         :datetime
#
require 'test_helper'

class SalesOrderTest < ActiveSupport::TestCase

  def test_total_price_uninvoiced
    assert_equal(BigDecimal.new("46"), SalesOrder.find(1).total_price)
  end

  def test_total_price_invoiced
    assert_equal(BigDecimal.new("40"), SalesOrder.find(2).total_price)
  end
  
  def test_total_cost_uninvoiced
    assert_equal(BigDecimal.new("3.0"), SalesOrder.find(1).total_cost)
  end

  def test_total_cost_invoiced
    assert_equal(BigDecimal.new("3.0"), SalesOrder.find(1).total_cost)
  end
  
end





