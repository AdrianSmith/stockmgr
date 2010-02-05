# == Schema Information
#
# Table name: purchase_orders
#
#  id                 :integer(4)      not null, primary key
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

require 'test_helper'

class PurchaseOrderTest < ActiveSupport::TestCase
  should_have_many :purchase_order_items
  should_belong_to :supplier
  should_validate_presence_of :supplier

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
  
end




