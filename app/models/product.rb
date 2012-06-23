class Product < ActiveRecord::Base
  attr_accessible :active, :brand, :description, :gst, :name, :purchase_price, :supplier_id, :supplier_reference
end
