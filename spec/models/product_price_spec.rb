require 'spec_helper'

describe ProductPrice do
  before(:each) do
    @product = FactoryGirl.create(:product, :product_type_id => FactoryGirl.create(:product_type).id, :supplier_id => FactoryGirl.create(:supplier).id)
    @valid_attributes = {
      :amount => BigDecimal.new("10.5"),
      :product_id => @product.id
    }
  end

  it "should create a new instance given valid attributes" do
    ProductPrice.create!(@valid_attributes)
  end

  it {should belong_to(:product)}
  it {should validate_presence_of(:product)}
  it {should validate_presence_of(:amount)}

end
