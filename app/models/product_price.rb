class ProductPrice < ActiveRecord::Base
  attr_accessible :amount, :product_id

  belongs_to :product, :inverse_of => :product_prices

  validates_presence_of :product, :amount
end
