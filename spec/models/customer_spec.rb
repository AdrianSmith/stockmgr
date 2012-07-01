require 'spec_helper'

describe Customer do
  before(:each) do
    @valid_attributes = {
      :first_name => 'John',
      :last_name => 'Citizen',
      :email => 'john.citizen@gmail.com',
      :address_line_1 => '25 Brisbane St',
      :suburb => 'Brisbane',
      :postcode => '4000',
    }
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      FactoryGirl.create(:customer)
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
      @customer = FactoryGirl.build(:customer)
    end

    it "should create a pretty address string" do
      @customer.pretty_address.should_not be nil
    end

    it "should create a pretty phone string" do
      @customer.pretty_phone.should_not be nil
    end

    it "should save names properly" do
      @customer.update_attributes! :name => "Joe Bloggs"
      @customer.reload.first_name.should == "Joe"
      @customer.last_name.should == "Bloggs"
      @customer.name.should == "Joe Bloggs"
    end

    it 'should save only the first word as first name and collect all names thereafter into the last_name' do
      @customer.update_attributes! :name => "Olivia Newton John"
      @customer.reload.first_name.should == "Olivia"
      @customer.last_name.should == "Newton John"
      @customer.name.should == "Olivia Newton John"
    end
  end
end
