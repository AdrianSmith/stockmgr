require 'spec_helper'

describe "purchase_order_items/index.html.haml" do
  before(:each) do
    assign(:purchase_order_items, [
      stub_model(PurchaseOrderItem,
        :product_id => 1,
        :purchase_order_id => 1,
        :quantity => "9.99"
      ),
      stub_model(PurchaseOrderItem,
        :product_id => 1,
        :purchase_order_id => 1,
        :quantity => "9.99"
      )
    ])
  end

  it "renders a list of purchase_order_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
