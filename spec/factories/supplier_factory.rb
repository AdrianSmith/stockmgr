FactoryGirl.define do
  factory :supplier do
    sequence(:name) {|n| "Supplier#{n}"}
    description "MyText"
    website "MyString"
    email "MyString"
    account_name "MyString"
    account_number "MyString"
    delivery_rules "MyText"
    address_line_1 "MyString"
    address_line_2 "MyString"
    suburb "MyString"
    city "MyString"
    postcode "MyString"
    phone_mobile "MyString"
    phone_home "MyString"
    phone_work "MyString"
    comment "MyText"
  end
end