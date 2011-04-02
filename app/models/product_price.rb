class ProductPrice < ActiveRecord::Base
  belongs_to :product
  
  validates_presence_of :product, :amount
end
