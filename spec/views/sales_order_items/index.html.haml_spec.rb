require 'spec_helper'

describe "sales_order_items/index" do
  before(:each) do
    assign(:sales_order_items, [
      stub_model(SalesOrderItem,
        :sales_order_id => 1,
        :product_id => 2,
        :quantity => "9.99"
      ),
      stub_model(SalesOrderItem,
        :sales_order_id => 1,
        :product_id => 2,
        :quantity => "9.99"
      )
    ])
  end

  it "renders a list of sales_order_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
