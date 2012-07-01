require 'spec_helper'

describe Supplier do
  before(:each) do
    @valid_attributes = {
      :name => 'Location'
    }
  end

  it "should create a new instance given valid attributes" do
    Supplier.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      @supplier = FactoryGirl.create(:supplier)
    end

    it {should have_many(:products)}
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}

    it "should create a pretty address string" do
      assert_not_nil(@supplier.pretty_address)
    end

    it "should create a pretty phone string" do
      assert_not_nil(@supplier.pretty_phone)
    end
  end
end