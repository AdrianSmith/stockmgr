# == Schema Information
#
# Table name: products
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  image_url           :string(255)
#  description         :text
#  supplier_reference  :text
#  product_type_id     :integer(4)
#  supplier_id         :integer(4)
#  certifier_id        :integer(4)
#  storage_type_id     :integer(4)
#  units_of_measure_id :integer(4)
#  minimum_quantity    :integer(4)
#  storage_location_id :integer(4)
#  physical_form_id    :integer(4)
#  stock_quantity      :integer(4)
#  purchase_price      :decimal(8, 2)   default(0.0)
#  sale_price          :decimal(8, 2)   default(0.0)
#  created_at          :datetime
#  updated_at          :datetime
#  include_gst         :boolean(1)
#

require 'spec_helper'

describe Product do
  before(:each) do
    @product_type = Factory(:product_type)
    @supplier = Factory(:supplier)
    @certifier = Factory(:certifier)
    @uom = Factory(:units_of_measure)
    @store_type = Factory(:storage_type)
    @store_location = Factory(:storage_location)
    @valid_attributes = {
      :name => 'Food',
      :product_type => @product_type,
      :supplier => @supplier,
      :certifier => @certifier,
      :units_of_measure => @uom,
      :storage_type => @store_type,
      :storage_location => @store_location,
      :minimum_quantity => 10
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      @product = Factory.build(:product)
      @product.update_attributes(@valid_attributes)
    end
    it {should belong_to(:product_type)}
    it {should belong_to(:supplier)}
    it {should belong_to(:certifier)}
    it {should belong_to(:units_of_measure)}
    it {should belong_to(:storage_type)}
    it {should belong_to(:storage_location)}
    it {should belong_to(:physical_form)}
    it {should have_many(:sales_order_items)}
    it {should have_many(:purchase_order_items)}

    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:product_type)}
    it {should validate_presence_of(:supplier)}
    it {should validate_presence_of(:certifier)}
    it {should validate_presence_of(:units_of_measure)}
    it {should validate_presence_of(:minimum_quantity)}
    it {should validate_presence_of(:storage_type)}
    it {should validate_presence_of(:storage_location)}

    it "should calculate cost" do
      assert_equal(BigDecimal.new("2.53"), @product.cost)
    end

    it "calculate price if excludes GST" do
      assert_equal(BigDecimal.new("5.24"), @product.price)
    end

    it "calculate 0.0 for GST if excludes GST" do
      assert_equal(BigDecimal.new("0.0"), @product.gst)
    end

    it "calculate price if includes GST" do
      @product.include_gst = true
      assert_equal(BigDecimal.new("5.24") * 1.1, @product.price)
    end

    it "calculate GST component if includes GST" do
      @product.include_gst = true
      assert_equal(BigDecimal.new("5.24") * 0.1, @product.gst)
    end

    it "calculate suggested quantities" do
      @product.minimum_quantity = 10
      expected_data = [10, 20, 30, 40, 50, 100, 200, 500, 1000]
      assert_equal(expected_data, @product.suggested_quantities)
    end

  end

end
