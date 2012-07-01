FactoryGirl.define do
  factory :product_type do
    sequence(:name) {|n| "ProductType#{n}"}
    description "MyText"
  end
end