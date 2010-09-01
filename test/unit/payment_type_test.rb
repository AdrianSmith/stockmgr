# == Schema Information
#
# Table name: payment_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class PaymentTypeTest < ActiveSupport::TestCase
  should_have_many(:payments)
  should_validate_presence_of(:name)
  should_validate_uniqueness_of(:name)

end