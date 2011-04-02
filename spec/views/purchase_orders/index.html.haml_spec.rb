require 'spec_helper'

describe "purchase_orders/index.html.haml" do
  before(:each) do
    assign(:purchase_orders, [
      stub_model(PurchaseOrder,
        :supplier_id => 1,
        :comment => "MyText",
        :paid? => false,
        :received? => false,
        :amount => "9.99",
        :include_gst => false
      ),
      stub_model(PurchaseOrder,
        :supplier_id => 1,
        :comment => "MyText",
        :paid? => false,
        :received? => false,
        :amount => "9.99",
        :include_gst => false
      )
    ])
  end

  it "renders a list of purchase_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
