# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :product do |f|
  f.name "MyString"
  f.description "MyText"
  f.supplier_reference "MyText"
  f.product_type_id 1
  f.supplier_id 1
  f.certifier_id 1
  f.storage_type_id "MyString"
  f.units_of_measure_id 1
  f.minimum_quantity 1
  f.storage_location_id 1
  f.physical_form_id 1
  f.purchase_price { BigDecimal.new("2.53") }
  f.include_gst false
end
