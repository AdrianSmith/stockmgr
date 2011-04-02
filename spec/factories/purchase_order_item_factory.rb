# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :purchase_order_item do |f|
  f.product { Product.new(:purchase_price => BigDecimal.new("1.50")) }
  f.quantity 100
end
