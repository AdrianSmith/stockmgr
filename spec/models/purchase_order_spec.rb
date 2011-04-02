require 'spec_helper'

describe PurchaseOrder do
  before(:each) do
    @supplier = Factory(:supplier)
    @valid_attributes = {
      :amount => BigDecimal.new("10.50"),
      :supplier => @supplier,
      :paid => false,
      :received => true
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
  end

  context "that has been paid" do
    it "should have a status message of PAID" do
      @purchase_order = Factory.build(:purchase_order, :paid => true)
      assert_equal("PAID", @purchase_order.status_message)
    end
  end

  context "that has been received" do
    it "should have a status message of RECEIVED" do
      @purchase_order = Factory.build(:purchase_order, :received => true)
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
