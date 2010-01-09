require 'test_helper'

class ProductPriceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: product_prices
#
#  id         :integer(4)      not null, primary key
#  product_id :integer(4)
#  amount     :decimal(8, 2)   default(0.0)
#  comment    :text
#  created_at :datetime
#  updated_at :datetime
#

