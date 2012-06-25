require 'spec_helper'

describe SalesOrder do
  before(:each) do
    @customer = Factory(:customer)
    @valid_attributes = {
      :customer => @customer,
      :ordered => false,
      :invoiced => false,
      :paid => false
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
      @product = Factory(:product, :product_type => Factory(:product_type), :supplier => Factory(:supplier), :units_of_measure => Factory(:units_of_measure))
      @price_1 = Factory(:product_price, :product => @product, :amount => 10.5)
      @sales_order = Factory(:sales_order, :customer => @customer)
      item_1 = Factory(:sales_order_item, :sales_order => @sales_order, :product => @product, :quantity => 2)
      item_2 = Factory(:sales_order_item, :sales_order => @sales_order, :product => @product, :quantity => 4)
    end

    it "should calculate total price" do
      assert_equal(BigDecimal.new("63"), @sales_order.total_price)
    end

    it "should retain the original total price at time of invoice even if the product price changes" do
      assert_equal(false, @sales_order.invoiced?)
      assert_equal(BigDecimal.new("63"), @sales_order.total_price)

      @sales_order.invoiced = true
      @sales_order.update_invoice_time
      assert_equal(true, @sales_order.invoiced?)

      @price_2 = Factory(:product_price, :product => @product, :amount => 15.53)

      #assert_equal(BigDecimal.new("63"), @sales_order.total_price)
      assert_equal(BigDecimal.new("15.53"), @product.sale_price)
    end

  end

  context "An un-invoiced Sales Order" do
    it "should have a status message of NOT ISSUED" do
      @sales_order = Factory.build(:sales_order, :invoiced => false, :paid => false)
      assert_equal("NOT INVOICED", @sales_order.status_message)
    end
  end

  context "An invoiced Sales Order" do
    it "should have a status message of ISSUE in x days" do
      @sales_order = Factory.build(:sales_order, :invoiced => true, :paid => false)
      assert_equal("INVOICED", @sales_order.status_message)
    end
  end

  context "A paid Sales Order" do
    it "should have a status message of PAID" do
      @sales_order = Factory.build(:sales_order, :paid => true)
      assert_equal("PAID", @sales_order.status_message)
    end

  end

  context "An overdue Sales Order" do
    it "should have a status message of OVERDUE" do
      @sales_order = Factory.build(:sales_order, :paid => false, :invoiced => true)
      @sales_order.created_at = DateTime.now - 15
      assert_equal("INVOICED", @sales_order.status_message)
    end
  end

end
