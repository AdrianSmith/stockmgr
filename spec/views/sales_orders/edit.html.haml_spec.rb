require 'spec_helper'

describe "sales_orders/edit.html.haml" do
  before(:each) do
    @sales_order = assign(:sales_order, stub_model(SalesOrder,
      :user_id => 1,
      :ordered? => false,
      :invoiced? => false,
      :paid? => false,
      :invoice_amount => "9.99",
      :public_comment => "MyText",
      :private_comment => "MyText"
    ))
  end

  it "renders the edit sales_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sales_order_path(@sales_order), :method => "post" do
      assert_select "input#sales_order_user_id", :name => "sales_order[user_id]"
      assert_select "input#sales_order_ordered", :name => "sales_order[ordered]"
      assert_select "input#sales_order_invoiced", :name => "sales_order[invoiced]"
      assert_select "input#sales_order_paid", :name => "sales_order[paid]"
      assert_select "input#sales_order_invoice_amount", :name => "sales_order[invoice_amount]"
      assert_select "textarea#sales_order_public_comment", :name => "sales_order[public_comment]"
      assert_select "textarea#sales_order_private_comment", :name => "sales_order[private_comment]"
    end
  end
end
