require 'test_helper'

class SuppliersContactDetailTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: suppliers_contact_details
#
#  id                     :integer(4)      not null, primary key
#  supplier_id            :integer(4)
#  contact_detail_id      :integer(4)
#  contact_detail_type_id :integer(4)
#  created_at             :datetime
#  updated_at             :datetime
#

