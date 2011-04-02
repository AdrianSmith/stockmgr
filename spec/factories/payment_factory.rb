# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :payment do |f|
  f.amount "9.99"
  f.payment_type_id 1
  f.customer_id 1
  f.received_at "2010-12-25 15:42:01"
  f.comment "MyText"
end
