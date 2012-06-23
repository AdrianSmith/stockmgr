require 'spec_helper'

describe "product_types/show" do
  before(:each) do
    @product_type = assign(:product_type, stub_model(ProductType,
      :name => "Name",
      :description => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
