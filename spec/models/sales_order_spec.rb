# == Schema Information
#
# Table name: sales_orders
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  private_comment    :text
#  created_by_user_id :integer(4)
#  is_ordered         :boolean(1)      default(FALSE)
#  is_invoiced        :boolean(1)      default(FALSE)
#  is_paid            :boolean(1)      default(FALSE)
#  invoice_amount     :decimal(8, 2)   default(0.0)
#  invoiced_at        :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  public_comment     :text
#

require 'spec_helper'

describe SalesOrder do
  before(:each) do
    @user = Factory.build(:user)
    @valid_attributes = {
      :user => @user
    }
  end

  it "should create a new instance given valid attributes" do
    SalesOrder.create!(@valid_attributes)
  end

  it {should validate_presence_of(:user)}
  it {should have_many(:sales_order_items)}
  it {should belong_to(:user)}

  context "A valid Sales Order" do
    before do
      product = Factory.build(:product)
      item_1 = Factory.build(:sales_order_item)
      item_2 = Factory.build(:sales_order_item)
      item_1.product = product
      item_2.product = product
      item_1.save
      item_2.save
      @sales_order = Factory.build(:sales_order)
      @sales_order.sales_order_items = [item_1, item_2]
      @sales_order.save
    end

    it "should calculate total cost" do
      assert_equal(BigDecimal.new("506.0"), @sales_order.total_cost)
    end

    it "should calculate total price" do
      assert_equal(BigDecimal.new("1048.0"), @sales_order.total_price)
    end
  end
  
  context "An un-invoiced Sales Order" do
    it "should have a status message of NOT ISSUED" do
      @sales_order = Factory.build(:sales_order, :is_invoiced => false, :is_paid => false)
      assert_equal("NOT INVOICED", @sales_order.status_message)
    end
  end
  
  context "An invoiced Sales Order" do
      it "should have a status message of ISSUE in x days" do
        @sales_order = Factory.build(:sales_order, :is_invoiced => true, :is_paid => false)
        assert_equal("INVOICED", @sales_order.status_message)
      end
    end
    
   context "A paid Sales Order" do
      it "should have a status message of PAID" do
        @sales_order = Factory.build(:sales_order, :is_paid => true)
        assert_equal("PAID", @sales_order.status_message)
      end
    end
   
    context "An overdue Sales Order" do
      it "should have a status message of OVERDUE" do
        @sales_order = Factory.build(:sales_order, :is_paid => false, :is_invoiced => true)
        @sales_order.created_at = DateTime.now - 15
        assert_equal("INVOICED", @sales_order.status_message)
      end
    end
 
end
