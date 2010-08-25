# == Schema Information
#
# Table name: purchase_orders
#
#  id                 :integer(4)      not null, primary key
#  supplier_id        :integer(4)
#  comment            :text
#  is_paid            :boolean(1)      default(FALSE)
#  is_received        :boolean(1)      default(FALSE)
#  created_by_user_id :integer(4)
#  amount             :decimal(8, 2)   default(0.0)
#  created_at         :datetime
#  updated_at         :datetime
#  include_gst        :boolean(1)
#

class PurchaseOrder < ActiveRecord::Base
  belongs_to :supplier
  has_many :purchase_order_items

  validates_presence_of :supplier   

  def total_cost
    purchase_order_items.inject(0){|sum, o| sum + o.cost} 
  end

  def status_message
    if self.is_received
      "RECEIVED"
    elsif self.is_paid
      "PAID"
    else
      "CREATED"
    end  
  end
  
end
