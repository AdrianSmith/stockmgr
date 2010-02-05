# == Schema Information
#
# Table name: purchase_orders
#
#  id                 :integer(4)      not null, primary key
#  supplier_id        :integer(4)
#  comment            :text
#  is_created         :boolean(1)
#  is_paid            :boolean(1)
#  is_received        :boolean(1)
#  created_by_user_id :integer(4)
#  amount             :decimal(8, 2)   default(0.0)
#  created_at         :datetime
#  updated_at         :datetime
#

class PurchaseOrder < ActiveRecord::Base
  belongs_to :supplier
  has_many :purchase_order_items
  
  validates_presence_of :supplier   
  
  def total_cost
    purchase_order_items.inject(0){|sum, o| sum + o.cost} 
  end
  
end
