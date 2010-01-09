# == Schema Information
#
# Table name: sales_order_states
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class SalesOrderState < ActiveRecord::Base
  has_many :sales_order

  validates_uniqueness_of :name

end

