# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :sales_order do |f|
  f.customer_id 1
  f.ordered false
  f.invoiced false
  f.paid false
  f.invoiced_at "2010-12-25 16:10:18"
  f.public_comment "MyText"
  f.private_comment "MyText"
end
