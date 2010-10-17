# == Schema Information
#
# Table name: product_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

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
      Factory(:product_type)
    end
    it {should have_many(:products)}
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
  end
  
end
