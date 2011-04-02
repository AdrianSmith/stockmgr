# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :sales_order_item do |f|
  f.sales_order_id 1
  f.product_id 1
  f.quantity 100
end
