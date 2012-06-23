require 'spec_helper'

describe "sales_orders/index" do
  before(:each) do
    assign(:sales_orders, [
      stub_model(SalesOrder,
        :customer_id => 1,
        :state => "State",
        :private_comment => "Private Comment",
        :public_comment => "Public Comment"
      ),
      stub_model(SalesOrder,
        :customer_id => 1,
        :state => "State",
        :private_comment => "Private Comment",
        :public_comment => "Public Comment"
      )
    ])
  end

  it "renders a list of sales_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Private Comment".to_s, :count => 2
    assert_select "tr>td", :text => "Public Comment".to_s, :count => 2
  end
end
