# == Schema Information
#
# Table name: purchase_order_items
#
#  id                :integer(4)      not null, primary key
#  product_id        :integer(4)
#  purchase_order_id :integer(4)
#  quantity          :decimal(12, 3)  default(0.0)
#  created_at        :datetime
#  updated_at        :datetime
#

require 'test_helper'

class PurchaseOrderItemTest < ActiveSupport::TestCase
  should_belong_to :purchase_order
  should_belong_to :product
  
  should_validate_presence_of :purchase_order
  should_validate_presence_of :product
  should_validate_presence_of :quantity
  
  context "A valid Purchase Order Item" do
     setup do
       @item = Factory.build(:purchase_order_item)
     end
   
     should "calculate cost" do
       assert_equal(BigDecimal.new("150"), @item.cost)
     end
   
     should "calculate price" do
       assert_equal(BigDecimal.new("250"), @item.price)
     end
   end 
   
   context "A valid Purchase Order Item with a decimal quantity" do

      should "calculate price based on the quantity and the product price" do
        test_quantity = BigDecimal.new("12.45")
        @item = Factory.build(:purchase_order_item, :quantity => test_quantity)
        assert_equal(test_quantity * @item.product.cost, @item.cost)
      end
    end             
  
end



