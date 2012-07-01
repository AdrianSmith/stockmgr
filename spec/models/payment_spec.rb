require 'spec_helper'

describe Payment do
  before(:each) do
    @customer = FactoryGirl.create(:customer)
    @payment_type = FactoryGirl.create(:payment_type)
    @valid_attributes = {
      :amount => BigDecimal.new('10.50'),
      :payment_type_id => @payment_type.id,
      :customer_id => @customer.id,
      :received_at => DateTime.now
    }
  end

  it "should create a new instance given valid attributes" do
    Payment.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      payment = FactoryGirl.build(:payment)
      payment.update_attributes(@valid_attributes)
    end
    it {should belong_to(:payment_type)}
    it {should belong_to(:customer)}

    it {should validate_presence_of(:customer)}
    it {should validate_presence_of(:amount)}
    it {should validate_presence_of(:payment_type)}

  end
end
