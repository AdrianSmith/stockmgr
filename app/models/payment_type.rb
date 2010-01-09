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

class PaymentType < ActiveRecord::Base
  has_many :payments
  validates_uniqueness_of :name

end