# == Schema Information
#
# Table name: purchase_orders
#
#  id                 :integer(4)      not null, primary key
#  supplier_id        :integer(4)
#  comment            :text
#  is_paid            :boolean(1)      default(FALSE)
#  is_received        :boolean(1)      default(FALSE)
#  created_by_user_id :integer(4)
#  amount             :decimal(8, 2)   default(0.0)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'test_helper'

class PurchaseOrderTest < ActiveSupport::TestCase
  should have_many(:purchase_order_items)
  should belong_to(:supplier)
  should validate_presence_of(:supplier)

  context "A valid Purchase Order" do
    setup do
      items = [Factory.build(:purchase_order_item), Factory.build(:purchase_order_item)]
      @purchase_order = Factory.build(:purchase_order) 
      @purchase_order.purchase_order_items = items
    end

    should "calculate total cost" do
      assert_equal(BigDecimal.new("300.0"), @purchase_order.total_cost)
    end
  end  

  context "A paid Purchase Order" do
    should "have a status message of PAID" do
      @purchase_order = Factory.build(:purchase_order, :is_paid => true) 
      assert_equal("PAID", @purchase_order.status_message)
    end
  end  

  context "A received Purchase Order" do
    should "have a status message of RECEIVED" do
      @purchase_order = Factory.build(:purchase_order, :is_received => true) 
      assert_equal("RECEIVED", @purchase_order.status_message)
    end
  end  

  context "A new Purchase Order" do
    should "have a status message of CREATED" do
      @purchase_order = Factory.build(:purchase_order) 
      assert_equal("CREATED", @purchase_order.status_message)
    end
  end  
  
end




