# == Schema Information
#
# Table name: product_prices
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)
#  amount     :decimal(8, 2)   default(0.0)
#  comment    :text
#  created_at :datetime
#  updated_at :datetime
#

class ProductPrice < ActiveRecord::Base
  belongs_to :product
  
  validates_presence_of :amount
  validates_numericality_of :amount
 
  def to_s
    "#ProductPrice " + self.id.to_s + " [Product Id: " + self.product_id.to_s + "Price: " + self.amount.to_s + ", Comment: " + self.comment.to_s + "]"
  end 
  
  def price
    amount
  end
  
  protected
  def validate
    if amount
      errors.add(:amount, "cannot be negative") if amount < 0
    end
  end

end
