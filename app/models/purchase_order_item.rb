# == Schema Information
#
# Table name: purchase_order_items
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)
#  quantity   :integer(10)
#  price      :decimal(8, 2)   default(0.0)
#  created_at :datetime
#  updated_at :datetime
#

class PurchaseOrderItem < ActiveRecord::Base 
  belongs_to :purchase_order
  belongs_to :supplier    
  
  validates_presence_of :supplier, :purchase_order
  
end






