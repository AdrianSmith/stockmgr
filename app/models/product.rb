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
