# == Schema Information
#
# Table name: product_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class ProductTypeTest < ActiveSupport::TestCase
  should have_many(:products)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
end
