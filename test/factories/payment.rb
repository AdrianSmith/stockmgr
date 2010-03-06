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
Factory.define :payment do |obj|
  obj.amount {BigDecimal.new("10.5")}
  obj.payment_type {PaymentType.new(:name => 'cash')}
  obj.user {User.new(:id => 2)}
end