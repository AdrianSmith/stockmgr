require 'spec_helper'

describe Product do
  before(:each) do
    @product_type = FactoryGirl.create(:product_type)
    @supplier = FactoryGirl.create(:supplier)
    @valid_attributes = {
      :name => 'Food',
      :product_type => @product_type,
      :supplier => @supplier,
      :purchase_price => 5.5,
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      @product = Product.create!(@valid_attributes)
      @price_1 = FactoryGirl.create(:product_price, :product => @product, :amount => 10.5)
      @price_2 = FactoryGirl.create(:product_price, :product => @product, :amount => 20.8)
    end

    it {should belong_to(:product_type)}
    it {should belong_to(:supplier)}
    it {should have_many(:sales_order_items)}
    it {should have_many(:product_prices)}

    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:product_type)}
    it {should validate_presence_of(:supplier)}

    it {should validate_uniqueness_of(:name)}

    it "should calculate purchase_price" do
      @product.purchase_price.should == BigDecimal.new("5.5")
    end

    it "should calculate sale_price" do
      @product.sale_price.should == BigDecimal.new("20.8")
    end

    it "should calculate a price based on a time" do
      old_time = Time.now
      sleep(2)
      @price_new = FactoryGirl.create(:product_price, :product => @product, :amount => 23.55)
      new_time = Time.now

      @product.sale_price(old_time).should == BigDecimal.new("20.80")
      @product.sale_price(new_time).should == BigDecimal.new("23.55")
    end

    it "should calculate 0.0 for gst_sale_price if excludes GST" do
      @product.gst = false
      @product.gst_sale_price.should == BigDecimal.new("0.0")
    end

    it "should calculate GST component on sale_price if includes GST" do
      @product.gst = true
      @product.gst_sale_price.should == BigDecimal.new("20.8") / 1.1 * 0.1
    end

  end
end
