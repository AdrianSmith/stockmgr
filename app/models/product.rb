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
#

class Product < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :supplier
  belongs_to :certifier
  belongs_to :units_of_measure
  belongs_to :storage_type
  belongs_to :storage_location
  belongs_to :physical_form
  has_many :sales_order_items
  has_many :purchase_order_items 
  
  validates_presence_of :name, :product_type, :supplier, :certifier, :units_of_measure, :minimum_quantity

   def price
     self.sale_price
   end

   def cost
     self.purchase_price
   end
   
   def total_stock_price 
     price * stock_quantity
   end

   def total_stock_cost
     cost * stock_quantity
   end
   
   def suggested_quantities
     [1, 2, 3, 4, 5, 10, 20, 50, 100].collect{|f| f * minimum_quantity}
   end
     
end
