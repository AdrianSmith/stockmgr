require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: suppliers
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  description    :text
#  website        :string(255)
#  email          :string(255)
#  account_name   :string(255)
#  account_number :string(255)
#  comment        :text
#  delivery_rules :text
#  created_at     :datetime
#  updated_at     :datetime
#

