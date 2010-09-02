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

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  should validate_presence_of(:user)
  should belong_to(:payment_type)
  should belong_to(:user)

end
