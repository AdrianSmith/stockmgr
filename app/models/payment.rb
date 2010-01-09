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

class Payment < ActiveRecord::Base
  belongs_to :user     
  belongs_to :payment_type

  def created_by
    User.find(self.created_by_user_id) if User.exists?(self.created_by_user_id)
  end

end



