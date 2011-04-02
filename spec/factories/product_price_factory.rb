# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :product_price do |f|
  f.product_id 1
  f.amount "9.99"
end
