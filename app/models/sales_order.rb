# == Schema Information
#
# Table name: sales_orders
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  comment            :text
#  created_by_user_id :integer(4)
#  is_ordered         :boolean(1)
#  is_invoiced        :boolean(1)
#  is_paid            :boolean(1)
#  invoice_amount     :integer(10)
#  invoiced_at        :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class SalesOrder < ActiveRecord::Base
  belongs_to :user
  has_many :sales_order_items

  validates_presence_of :user_id
  
  def total_price
    total = 0.0
    sales_order_items.each do |item|
      total += item.price
    end
    total
  end
  
  def total_cost
    total = 0.0
    sales_order_items.each do |item|
      total += item.product.stock_unit_cost
    end
    total
  end
  
end



