require 'spec_helper'

describe ProductPrice do
  before(:each) do
    @product = Factory(:product, :product_type => Factory(:product_type), :supplier => Factory(:supplier), :units_of_measure => Factory(:units_of_measure))
    @valid_attributes = {
      :amount => BigDecimal.new("10.5"),
      :product => @product
    }
  end

  it "should create a new instance given valid attributes" do
    ProductPrice.create!(@valid_attributes)
  end
  
  it {should belong_to(:product)}
  it {should validate_presence_of(:product)}
  it {should validate_presence_of(:amount)}  
    
end
