require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :description => "MyText",
        :supplier_id => 1,
        :supplier_reference => "Supplier Reference",
        :brand => "Brand",
        :purchase_price => "9.99",
        :gst => false,
        :active => ""
      ),
      stub_model(Product,
        :name => "Name",
        :description => "MyText",
        :supplier_id => 1,
        :supplier_reference => "Supplier Reference",
        :brand => "Brand",
        :purchase_price => "9.99",
        :gst => false,
        :active => ""
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Supplier Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
