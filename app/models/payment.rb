class Payment < ActiveRecord::Base
  belongs_to :customer     
  belongs_to :payment_type
  
  validates_presence_of :customer, :amount, :payment_type

  def created_by
    User.find(self.created_by_user_id) if User.exists?(self.created_by_user_id)
  end
end
