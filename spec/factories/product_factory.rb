FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "Product#{n}"}
    brand "Cool Brand"
    description "MyText"
    supplier_reference "MyText"
    product_type {|e| e.association :product_type }
    supplier {|e| e.association :supplier }
    purchase_price { BigDecimal.new("2.53") }
    gst false
  end
end