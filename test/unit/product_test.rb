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
#  stock_quantity      :integer(10)
#  purchase_price      :decimal(8, 2)   default(0.0)
#  sale_price          :decimal(8, 2)   default(0.0)
#  created_at          :datetime
#  updated_at          :datetime
#  include_gst         :boolean(1)
#

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
#  storage_location_id :integer(4)
#  physical_form_id    :integer(4)
#  stock_quantity      :integer(10)
#  purchase_price          :integer(10)
#  sale_price          :integer(10)
#  created_at          :datetime
#  updated_at          :datetime
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  should belong_to(:product_type)
  should belong_to(:supplier)
  should belong_to(:certifier)
  should belong_to(:units_of_measure)
  should belong_to(:storage_type)
  should belong_to(:storage_location)
  should belong_to(:physical_form)
  should have_many(:sales_order_items)
  should have_many(:purchase_order_items)

  should validate_presence_of(:name)
  should validate_presence_of(:product_type)
  should validate_presence_of(:supplier)
  should validate_presence_of(:certifier)
  should validate_presence_of(:units_of_measure)
  should validate_presence_of(:minimum_quantity)

  context "A valid product instance" do
    setup do
      @product = Factory.build(:product)
    end

    should "calculate cost" do
      assert_equal(BigDecimal.new("2.53"), @product.cost)
    end

    should "calculate price if excludes GST" do
      assert_equal(BigDecimal.new("5.24"), @product.price)
    end

    should "calculate 0.0 for GST if excludes GST" do
      assert_equal(BigDecimal.new("0.0"), @product.gst)
    end

    should "calculate price if includes GST" do
      @product.include_gst = true
      assert_equal(BigDecimal.new("5.24") * 1.1, @product.price)
    end

    should "calculate GST component if includes GST" do
      @product.include_gst = true
      assert_equal(BigDecimal.new("5.24") * 0.1, @product.gst)
    end
  end

  context "A valid product with a minimum quantity" do
    should "calculate suggested quantities" do
      product = Factory.build(:product, :minimum_quantity => 10)
      expected_data = [10, 20, 30, 40, 50, 100, 200, 500, 1000]
      assert_equal(expected_data, product.suggested_quantities)
    end
  end

end
