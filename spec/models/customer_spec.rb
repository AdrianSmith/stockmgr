require 'spec_helper'

describe Customer do
  before(:each) do
    @valid_attributes = {
      :first_name => 'John',
      :last_name => 'Citizen',
      :email => 'john.citizen@gmail.com',
      :address_line_1 => '25 Brisbane St',
      :suburb_town => 'Brisbane',
      :postcode => '4000',
      :state => 'Queensland',
      :country => 'Australia',
    }
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      Factory(:customer)
    end
    it {should have_many(:sales_orders)}
    it {should have_many(:payments)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
  end

  context "A valid customer" do
    before do
      @customer = Factory.build(:customer)
    end

    it "should create a pretty address string" do
      assert_not_nil(@customer.pretty_address)
    end

    it "should create a pretty phone string" do
      assert_not_nil(@customer.pretty_phone)
    end
  end
end
