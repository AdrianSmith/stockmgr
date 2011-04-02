require 'spec_helper'

describe "sales_orders/index.html.haml" do
  before(:each) do
    assign(:sales_orders, [
      stub_model(SalesOrder,
        :user_id => 1,
        :ordered? => false,
        :invoiced? => false,
        :paid? => false,
        :invoice_amount => "9.99",
        :public_comment => "MyText",
        :private_comment => "MyText"
      ),
      stub_model(SalesOrder,
        :user_id => 1,
        :ordered? => false,
        :invoiced? => false,
        :paid? => false,
        :invoice_amount => "9.99",
        :public_comment => "MyText",
        :private_comment => "MyText"
      )
    ])
  end

  it "renders a list of sales_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
