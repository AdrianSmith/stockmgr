require 'spec_helper'

describe "product_types/index" do
  before(:each) do
    assign(:product_types, [
      stub_model(ProductType,
        :name => "Name",
        :description => "MyText",
        :active => false
      ),
      stub_model(ProductType,
        :name => "Name",
        :description => "MyText",
        :active => false
      )
    ])
  end

  it "renders a list of product_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
