# == Schema Information
#
# Table name: sales_order_items
#
#  id               :integer(4)      not null, primary key
#  sales_order_id   :integer(4)
#  product_id       :integer(4)
#  quantity         :decimal(12, 3)  default(0.0)
#  custom_price     :decimal(8, 2)   default(0.0)
#  use_custom_price :boolean(1)      default(FALSE)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class SalesOrderItemTest < ActiveSupport::TestCase
  should belong_to(:sales_order)
  should belong_to(:product)

  should validate_presence_of(:sales_order)
  should validate_presence_of(:product)
  should validate_presence_of(:quantity)

  context "A valid Sales Order Item" do
    setup do
      @item = Factory.build(:sales_order_item)
      product = Factory.build(:product)
      @item.product = product
      @item.save
    end

    should "calculate cost based on product cost" do
      assert_equal(BigDecimal.new("253.0"), @item.cost)
    end

    should "calculate price based on product price" do
      assert_equal(BigDecimal.new("524.0"), @item.price)
    end
  end

  context "A valid Sales Order Item with a set price" do

    should "calculate price based on the set price not the product price" do
      @item = Factory.build(:sales_order_item, :use_custom_price => true, :custom_price => BigDecimal.new("12.45"))
      assert_equal(BigDecimal.new("12.45"), @item.price)
    end
  end

  context "A valid Sales Order Item with a decimal quantity" do

    should "calculate price based on the quantity and the product price" do
      test_quantity = BigDecimal.new("12.45")
      @item = Factory.build(:sales_order_item, :quantity => test_quantity)
      product = Factory.build(:product)
      @item.product = product
      @item.save
      assert_equal(test_quantity * @item.product.price, @item.price)
    end
  end

end
