require 'spec_helper'

describe SalesOrder do
  before(:each) do
    @customer = FactoryGirl.create(:customer)
    @valid_attributes = {
      :customer_id => @customer.id,
      :invoiced => true,
      :invoiced_at => '2010-12-25'
    }
  end

  it "should create a new instance given valid attributes" do
    SalesOrder.create!(@valid_attributes)
  end

  it {should validate_presence_of(:customer)}
  it {should have_many(:sales_order_items)}
  it {should belong_to(:customer)}

  context "A valid Sales Order" do
    before do
      @product = FactoryGirl.create(:product, :product_type => FactoryGirl.create(:product_type), :supplier => FactoryGirl.create(:supplier))
      @price_1 = FactoryGirl.create(:product_price, :product => @product, :amount => 10.5)
      @sales_order = FactoryGirl.create(:sales_order, :customer => @customer)
      item_1 = FactoryGirl.create(:sales_order_item, :sales_order => @sales_order, :product => @product, :quantity => 2)
      item_2 = FactoryGirl.create(:sales_order_item, :sales_order => @sales_order, :product => @product, :quantity => 4)
    end

    it "should calculate total price" do
      @sales_order.total_price.should == BigDecimal.new("63")
    end

    it "should retain the original total price at time of invoice even if the product price changes" do
      @sales_order.invoiced?.should be false
      @sales_order.total_price.should == BigDecimal.new("63")

      @sales_order.invoiced = true
      @sales_order.invoiced_at = Time.now
      @sales_order.save

      @sales_order.invoiced?.should be true
      @sales_order.sales_order_items.each do |item|
        puts item.sales_order.invoiced?
      end

      @price_2 = FactoryGirl.create(:product_price, :product => @product, :amount => 15.53)
      @product.sale_price.should == BigDecimal.new("15.53")
      @sales_order.total_price.should == BigDecimal.new("93.18")
    end
  end

  context "An un-invoiced Sales Order" do
    it "should have a status message of NOT ISSUED" do
      @sales_order = FactoryGirl.build(:sales_order, :invoiced => false, :paid => false)
      @sales_order.status_message.should == "NOT INVOICED"
    end
  end

  context "An invoiced Sales Order" do
    it "should have a status message of ISSUE in x days" do
      @sales_order = FactoryGirl.build(:sales_order, :invoiced => true, :paid => false)
      @sales_order.status_message.should == "INVOICED"
    end
  end

  context "A paid Sales Order" do
    it "should have a status message of PAID" do
      @sales_order = FactoryGirl.build(:sales_order, :paid => true)
      @sales_order.status_message.should == "PAID"
    end
  end

  context "An overdue Sales Order" do
    it "should have a status message of OVERDUE" do
      @sales_order = FactoryGirl.build(:sales_order, :paid => false, :invoiced => true)
      @sales_order.created_at = DateTime.now - 15
      @sales_order.status_message.should == "INVOICED"
    end
  end
end
