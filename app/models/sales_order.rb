class SalesOrder < ActiveRecord::Base
  attr_accessible :customer_id, :invoiced_on, :paid_on, :private_comment, :public_comment, :state
end
