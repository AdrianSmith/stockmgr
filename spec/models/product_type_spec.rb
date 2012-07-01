require 'spec_helper'

describe ProductType do
  before(:each) do
    @valid_attributes = {
      :name => 'Food'
    }
  end

  it "should create a new instance given valid attributes" do
    ProductType.create!(@valid_attributes)
  end

  context "instanciated with valid attributes" do
    before do
      FactoryGirl.create(:product_type)
    end
    it {should have_many(:products)}
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
  end
end
