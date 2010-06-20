
require 'contact_detail_formatter.rb'

class Supplier < ActiveRecord::Base
  include ContactDetailFormatter
  
  has_many :products
  has_many :purchase_orders
  
  def total_purchase_orders
    self.purchase_orders.inject(0){|sum, o| sum + o.total_cost}
  end
    
end

