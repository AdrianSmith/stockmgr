# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :customer do |f|
  f.first_name "John"
  f.last_name "Citizen"
  f.email "john.citizen@gmail.com"
  f.address_line_1 "25 Devon Street"
  f.suburb_town "Annerley"
  f.city "Brisbane"
  f.state "Queensland"
  f.postcode "4000"
  f.country "Australia"
  f.phone_mobile "0434 247 990"
  f.phone_home "07 3160 5008"
  f.phone_work "07 3160 5008"
end
