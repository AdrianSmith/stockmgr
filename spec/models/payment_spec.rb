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

require 'spec_helper'

describe Payment do
  before(:each) do
    @user = Factory(:user)
    @payment_type = Factory(:payment_type)
    @valid_attributes = {
      :amount => BigDecimal.new('10.50'),
      :payment_type => @payment_type,
      :customer => @customer,
      :created_by_user_id => @user.id,
      :received_at => DateTime.now
    }
  end

  it "should create a new instance given valid attributes" do
    Payment.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      payment = Factory.build(:payment)
      payment.update_attributes(@valid_attributes)
    end
    it {should belong_to(:payment_type)}
    it {should belong_to(:user)}

    it {should validate_presence_of(:user)}
    it {should validate_presence_of(:created_by_user_id)}
    it {should validate_presence_of(:amount)}
    it {should validate_presence_of(:payment_type)}

  end

end
