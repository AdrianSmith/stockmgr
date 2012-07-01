FactoryGirl.define do
  factory :customer do
    first_name "John"
    last_name "Citizen"
    sequence(:email) {|n| "john.citizen.#{n}@example.com"}
    address_line_1 "25 Devon Street"
    suburb "Annerley"
    city "Brisbane"
    postcode "4000"
    phone_mobile "0434 247 990"
    phone_home "07 3160 5008"
    phone_work "07 3160 5008"
  end
end