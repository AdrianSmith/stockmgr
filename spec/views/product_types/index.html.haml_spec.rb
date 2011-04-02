require 'spec_helper'

describe "product_types/index.html.haml" do
  before(:each) do
    assign(:product_types, [
      stub_model(ProductType,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(ProductType,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of product_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
