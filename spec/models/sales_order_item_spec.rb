require 'spec_helper'

describe SalesOrderItem do
  before(:each) do
    @sales_order = FactoryGirl.create(:sales_order, :customer => FactoryGirl.create(:customer))
    @product = FactoryGirl.create(:product, :product_type => FactoryGirl.create(:product_type), :supplier => FactoryGirl.create(:supplier))
    @valid_attributes = {
      :product_id => @product.id,
      :sales_order_id => @sales_order.id,
      :quantity => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    SalesOrderItem.create!(@valid_attributes)
  end

  it {should belong_to(:product)}
  it {should belong_to(:sales_order)}
  it {should validate_presence_of(:quantity)}

  context "A valid SalesOrderItem" do
    before do
      @customer = FactoryGirl.create(:customer)
      @product = FactoryGirl.create(:product, :product_type => FactoryGirl.create(:product_type), :supplier => FactoryGirl.create(:supplier))
      @product_price = FactoryGirl.create(:product_price, :product => @product, :amount => "2.5")
      @sales_order = FactoryGirl.create(:sales_order, :customer => @customer)
      @sales_order_item_1 = FactoryGirl.create(:sales_order_item, :sales_order => @sales_order, :product => @product, :quantity => 2)
      @sales_order_item_2 = FactoryGirl.create(:sales_order_item, :sales_order => @sales_order, :product => @product, :quantity => 10)
    end

    it "should calculate unit price based on product price and time" do
      @sales_order_item_1.price.should == BigDecimal.new("5.00")
      @sales_order_item_2.price.should == BigDecimal.new("25.00")
    end

    it "should calculate price based on product and quantity" do
      @sales_order_item_1.unit_price.should == BigDecimal.new("2.50")
      @sales_order_item_2.unit_price.should == BigDecimal.new("2.50")
    end
  end
end
