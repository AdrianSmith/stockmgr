class UnitsOfMeasure < ActiveRecord::Base
  has_many :products

end

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

