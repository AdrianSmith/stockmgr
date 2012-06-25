require 'spec_helper'

describe Product do
  before(:each) do
    @product_type = Factory(:product_type)
    @supplier = Factory(:supplier)
    @certifier = Factory(:certifier)
    @uom = Factory(:units_of_measure)
    @store_type = Factory(:storage_type)
    @store_location = Factory(:storage_location)
    @form = Factory(:physical_form)
    @valid_attributes = {
      :name => 'Food',
      :product_type => @product_type,
      :supplier => @supplier,
      :certifier => @certifier,
      :units_of_measure => @uom,
      :storage_type => @store_type,
      :storage_location => @store_location,
      :minimum_quantity => 10,
      :purchase_price => 5.5,
      :physical_form => @form
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      @product = Product.create!(@valid_attributes)
      @price_1 = Factory(:product_price, :product => @product, :amount => 10.5)
      @price_2 = Factory(:product_price, :product => @product, :amount => 20.8)
    end

    it {should belong_to(:product_type)}
    it {should belong_to(:supplier)}
    it {should belong_to(:units_of_measure)}
    it {should have_many(:sales_order_items)}
    it {should have_many(:purchase_order_items)}
    it {should have_many(:product_prices)}

    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:product_type)}
    it {should validate_presence_of(:supplier)}
    it {should validate_presence_of(:units_of_measure)}

    it {should validate_uniqueness_of(:name)}

    it "should calculate purchase_price" do
      assert_equal(BigDecimal.new("5.5"), @product.purchase_price)
    end

    it "should calculate sale_price" do
      assert_equal(BigDecimal.new("20.8"), @product.sale_price)
    end

    it "should calculate 0.0 for gst_sale_price if excludes GST" do
      @product.include_gst = false
      assert_equal(BigDecimal.new("0.0"), @product.gst_sale_price)
    end

    it "should calculate GST component on sale_price if includes GST" do
      @product.include_gst = true
      assert_equal(BigDecimal.new("20.8") / 1.1 * 0.1, @product.gst_sale_price)
    end

  end
end
