require 'spec_helper'

describe "sales_orders/edit" do
  before(:each) do
    @sales_order = assign(:sales_order, stub_model(SalesOrder,
      :customer_id => 1,
      :state => "MyString",
      :private_comment => "MyString",
      :public_comment => "MyString"
    ))
  end

  it "renders the edit sales_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sales_orders_path(@sales_order), :method => "post" do
      assert_select "input#sales_order_customer_id", :name => "sales_order[customer_id]"
      assert_select "input#sales_order_state", :name => "sales_order[state]"
      assert_select "input#sales_order_private_comment", :name => "sales_order[private_comment]"
      assert_select "input#sales_order_public_comment", :name => "sales_order[public_comment]"
    end
  end
end
