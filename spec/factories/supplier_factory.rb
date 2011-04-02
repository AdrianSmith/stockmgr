# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :supplier do |f|
  f.name "MyString"
  f.description "MyText"
  f.website "MyString"
  f.email "MyString"
  f.account_name "MyString"
  f.account_number "MyString"
  f.delivery_rules "MyText"
  f.address_line_1 "MyString"
  f.address_line_2 "MyString"
  f.suburb_town "MyString"
  f.city "MyString"
  f.state "MyString"
  f.postcode "MyString"
  f.country "MyString"
  f.phone_mobile "MyString"
  f.phone_home "MyString"
  f.phone_work "MyString"
  f.comment "MyText"
end
