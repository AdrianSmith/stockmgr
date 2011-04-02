class PaymentType < ActiveRecord::Base
  has_many :payments
  validates_presence_of :name
  validates_uniqueness_of :name
end
