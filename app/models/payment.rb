class Payment < ActiveRecord::Base
  attr_accessible :amount, :comment, :customer_id, :payment_type_id, :received_at

  belongs_to :customer
  belongs_to :payment_type

  delegate :name, :to => :payment_type, :prefix => true

  validates_presence_of :customer, :amount, :payment_type

  def created_by
    User.find(self.created_by_user_id) if User.exists?(self.created_by_user_id)
  end
end
