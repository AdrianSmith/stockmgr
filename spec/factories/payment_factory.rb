FactoryGirl.define do
  factory :payment do
    amount "9.99"
    payment_type_id 1
    customer_id 1
    received_at "2010-12-25 15:42:01"
    comment "MyText"
  end
end
