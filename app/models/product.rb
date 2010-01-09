class Product < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :supplier
  belongs_to :units_of_measure
  belongs_to :storage_type
  belongs_to :storage_location
  belongs_to :physical_form
  has_many :product_prices
  has_many :orders
  
end


# == Schema Information
#
# Table name: products
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  image_url           :string(255)
#  description         :text
#  product_type_id     :integer(4)
#  supplier_id         :integer(4)
#  certifier_id        :integer(4)
#  storage_type_id     :integer(4)
#  units_of_measure_id :integer(4)
#  storage_location_id :integer(4)
#  physical_form_id    :integer(4)
#  stock_amount        :integer(10)
#  created_at          :datetime
#  updated_at          :datetime
#

