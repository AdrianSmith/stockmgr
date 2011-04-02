# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :purchase_order do |f|
  f.supplier_id 1
  f.comment "MyText"
  f.paid false
  f.received false
  f.amount "9.99"
end
