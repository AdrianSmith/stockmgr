require 'spec_helper'

describe PurchaseOrderItem do
  before(:each) do
    @supplier = Factory(:supplier)
    @certifier = Factory(:certifier)
    @product_type = Factory(:product_type)
    @uom = Factory(:units_of_measure)
    @store_type = Factory(:storage_type)
    @store_location = Factory(:storage_location)

    @purchase_order = Factory(:purchase_order, :supplier => @supplier)
    @product = Factory(:product, :supplier => @supplier, :certifier => @certifier, :product_type => @product_type, :units_of_measure => @uom, :storage_type => @store_type, :storage_location => @store_location, :minimum_quantity => 1)

    @valid_attributes = {
      :product => @product,
      :purchase_order => @purchase_order,
      :quantity => BigDecimal.new("10.0")
    }
  end

  it "should create a new instance given valid attributes" do
    PurchaseOrderItem.create!(@valid_attributes)
  end

  it {should belong_to(:purchase_order)}
  it {should belong_to(:product)}
  it {should validate_presence_of(:purchase_order)}
  it {should validate_presence_of(:product)}
  it {should validate_presence_of(:quantity)}

  context "instanciated with valid attributes" do
    before do
      @item = Factory.build(:purchase_order_item)
    end

    it "should calculate purchase price" do
      assert_equal(BigDecimal.new("150.0"), @item.price)
    end

    context "and a decimal quantity" do
      it "should calculate price based on the quantity and the product price" do
        test_quantity = BigDecimal.new("12.45")
        @item = Factory.build(:purchase_order_item, :quantity => test_quantity)
        assert_equal(test_quantity * @item.product.purchase_price, @item.price)
      end
    end
  end
end
