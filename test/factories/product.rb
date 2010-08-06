# == Schema Information
#
# Table name: products
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  image_url           :string(255)
#  description         :text
#  supplier_reference  :text
#  product_type_id     :integer(4)
#  supplier_id         :integer(4)
#  certifier_id        :integer(4)
#  storage_type_id     :integer(4)
#  units_of_measure_id :integer(4)
#  storage_location_id :integer(4)
#  physical_form_id    :integer(4)
#  stock_quantity      :integer(10)
#  purchase_price      :integer(10)
#  sale_price          :integer(10)
#  created_at          :datetime
#  updated_at          :datetime
#

Factory.define :product do |p|
  p.name 'Almonds'
  p.stock_quantity 100
  p.purchase_price { BigDecimal.new("2.53") }
  p.sale_price { BigDecimal.new("5.24") }
end