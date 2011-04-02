require 'spec_helper'

describe "sales_order_items/index.html.haml" do
  before(:each) do
    assign(:sales_order_items, [
      stub_model(SalesOrderItem,
        :sales_order_id => 1,
        :product_id => 1,
        :quantity => "9.99",
        :custom_price => "9.99",
        :use_custom_price => false
      ),
      stub_model(SalesOrderItem,
        :sales_order_id => 1,
        :product_id => 1,
        :quantity => "9.99",
        :custom_price => "9.99",
        :use_custom_price => false
      )
    ])
  end

  it "renders a list of sales_order_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
