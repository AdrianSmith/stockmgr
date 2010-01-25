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

require File.dirname(__FILE__) + '/../test_helper'

class SalesOrderItemTest < ActiveSupport::TestCase
  
  def test_refresh_available_products_valid_selected_product_type
    item = SalesOrderItem.new
    item.selected_product_type = ProductType.find(2)
    item.refresh_available_products
    assert_equal(4, item.available_products.length)
  end

  def test_refresh_available_products_missing_selected_product_type
    item = SalesOrderItem.new
    item.refresh_available_products
    assert_equal(6, item.available_products.length)
  end

end




