class PurchaseOrder < ActiveRecord::Base
  belongs_to :supplier
  has_many :purchase_order_items
  
  validates_presence_of :supplier_id, :purchase_order_state   
  
  def to_s
    "#Order " + self.id.to_s + " [User: " + self.user_id.to_s + 
      ", Product: " + self.product_id.to_s +
      ", Quantity: " + self.quantity.to_s +
      ", Week: " + self.week.to_s +
      ", Year: " + self.year.to_s +
      ", Price: " + self.price.to_s +
      ", Invoiced: " + self.is_invoiced.to_s +
      ", Invoice Amount: " + self.invoice_amount.to_s +
      ", Valid: " + self.is_valid.to_s +
      "]"
  end
  
  def created_by
     User.find(self.created_by_user_id) if User.exists?(self.created_by_user_id)
   end

   def price
     # Price calculation considers:
     # 1. different order dates
     # 2. complementary orders
     # 3. user discounts
     # 4. amount calculated at time of invoice

     price = 0
     percentage_discount = 0

     if self.is_invoiced && self.invoice_amount
       price = self.invoice_amount
     else 
       unless self.is_complementary
         if self.product.is_discountable
           percentage_discount = self.user.percentage_discount if (self.user and self.user.percentage_discount)
         end
         price = self.product.price(self.created_at) * self.quantity * (100 - percentage_discount) / 100
       end  
     end
     price  
   end  
  
   def is_valid  
     if self.is_invoiced == true
       true
     else  
       false
     end
   end
  
  
end




# == Schema Information
#
# Table name: purchase_orders
#
#  id                 :integer(4)      not null, primary key
#  purchase_order_id  :integer(4)
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

