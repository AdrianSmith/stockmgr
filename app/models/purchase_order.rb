class PurchaseOrder < ActiveRecord::Base
  belongs_to :supplier
  has_many :purchase_order_items, :dependent => :destroy

  validates_presence_of :supplier   

  def total_price
    purchase_order_items.inject(0){|sum, o| sum + o.price} 
  end

  def total_gst
    purchase_order_items.inject(0){|sum, o| sum + o.gst} 
  end

  def status_message
    if self.received?
      "RECEIVED"
    elsif self.paid?
      "PAID"
    else
      "CREATED"
    end  
  end
end
