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

require 'test_helper'

class UnitsOfMeasureTest < ActiveSupport::TestCase
  should have_many(:products)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
end
