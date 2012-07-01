FactoryGirl.define do
  factory :payment_type do
    sequence(:name) {|n| "PaymentType#{n}"}
    description "MyText"
  end
end