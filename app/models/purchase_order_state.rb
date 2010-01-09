# == Schema Information
#
# Table name: purchase_order_states
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class PurchaseOrderState < ActiveRecord::Base
  has_many :purchase_order
  validates_uniqueness_of :name

end

