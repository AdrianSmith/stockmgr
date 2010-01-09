require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: payments
#
#  id                 :integer(4)      not null, primary key
#  amount             :decimal(8, 2)   default(0.0)
#  payment_type_id    :integer(4)
#  user_id            :integer(4)
#  created_by_user_id :integer(4)
#  received_at        :datetime
#  comment            :text
#  created_at         :datetime
#  updated_at         :datetime
#

