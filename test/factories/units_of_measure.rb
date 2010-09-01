# == Schema Information
#
# Table name: units_of_measures
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  short_name  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
Factory.define :units_of_measure do |uom|
  uom.name 'kilogram'
  uom.short_name 'kg'
end