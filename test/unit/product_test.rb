require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def test_price
    p = Product.find(1)
    assert_equal(9.99, p.price)
  end
end




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
#  stock_unit_cost     :integer(10)
#  created_at          :datetime
#  updated_at          :datetime
#

