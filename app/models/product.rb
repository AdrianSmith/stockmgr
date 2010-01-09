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

class Product < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :supplier
  belongs_to :certifier
  belongs_to :units_of_measure
  belongs_to :storage_type
  belongs_to :storage_location
  belongs_to :physical_form
  has_many :product_prices
  has_many :sales_order_items
  has_many :purchase_order_items 
  
  validates_presence_of :name, :product_type, :supplier, :certifier, :units_of_measure

  def to_s
     "#Product " + self.id.to_s + " [Name: " + self.name.to_s + ", Price: " + self.price.to_s + ", UoM: " + self.quantity_description + "]"
   end

   def price(time = Time.now)
     product_price(time).amount
   end

   def price_comment
     product_price.comment
   end

   def price_updated
     product_price.updated_at
   end

   def product_price (time = Time.now)
     all_prices = ProductPrice.find_all_by_product_id(self.id, :order => 'created_at')
     # Find the price that applies based on the time/date
     price = all_prices.first
     for pp in all_prices
       if time >= pp.created_at
         price = pp
       end
     end
     price
   end
     
end