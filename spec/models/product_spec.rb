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

require 'spec_helper'

describe Product do
  before(:each) do
    @product_type = ProductType.new
    @supplier = Supplier.new
    @certifier = Certifier.new
    @units_of_measure = UnitsOfMeasure.new
    @minimum_quantity = 1
    @storage_type = StorageType.new
    @storage_location = StorageLocation.new
    @valid_attributes = {:name => 'Almonds', 
                         :product_type => @product_type, 
                         :supplier => @supplier, 
                         :certifier => @certifier, 
                         :minimum_quantity => @minimum_quantity,
                         :storage_location => @storage_location,
                         :storage_type => @storage_type,
                         :units_of_measure => @units_of_measure}
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end
end
              
