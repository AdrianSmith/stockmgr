class Payment < ActiveRecord::Base
  attr_accessible :amount, :comment, :customer_id, :payment_type_id, :received_at
end
