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
#  include_gst        :boolean(1)
#

require 'spec_helper'

describe PurchaseOrder do
  before(:each) do
    @supplier = Factory(:supplier)
    @user = Factory.build(:user)
    @valid_attributes = {
      :amount => BigDecimal.new("10.50"),
      :supplier => @supplier,
      :is_paid => false,
      :is_received => true,
      :created_by_user_id => @user.id
    }
  end

  it "should create a new instance given valid attributes" do
    PurchaseOrder.create!(@valid_attributes)
  end

  it {should have_many(:purchase_order_items)}
  it {should belong_to(:supplier)}
  it {should validate_presence_of(:supplier)}

  context "with valid purchase order items" do
    before do
      items = [Factory.build(:purchase_order_item), Factory.build(:purchase_order_item)]
      @purchase_order = Factory.build(:purchase_order)
      @purchase_order.purchase_order_items = items
    end

    it "should calculate total cost" do
      assert_equal(BigDecimal.new("300.0"), @purchase_order.total_cost)
    end
  end

  context "that has been paid" do
    it "should have a status message of PAID" do
      @purchase_order = Factory.build(:purchase_order, :is_paid => true)
      assert_equal("PAID", @purchase_order.status_message)
    end
  end

  context "that has been received" do
    it "should have a status message of RECEIVED" do
      @purchase_order = Factory.build(:purchase_order, :is_received => true)
      assert_equal("RECEIVED", @purchase_order.status_message)
    end
  end

  context "that is neither paid or received" do
    it "should have a status message of CREATED" do
      @purchase_order = Factory.build(:purchase_order)
      assert_equal("CREATED", @purchase_order.status_message)
    end
  end
end
