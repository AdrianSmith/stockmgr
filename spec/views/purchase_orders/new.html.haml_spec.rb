require 'spec_helper'

describe "purchase_orders/new.html.haml" do
  before(:each) do
    assign(:purchase_order, stub_model(PurchaseOrder,
      :supplier_id => 1,
      :comment => "MyText",
      :paid? => false,
      :received? => false,
      :amount => "9.99",
      :include_gst => false
    ).as_new_record)
  end

  it "renders new purchase_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchase_orders_path, :method => "post" do
      assert_select "input#purchase_order_supplier_id", :name => "purchase_order[supplier_id]"
      assert_select "textarea#purchase_order_comment", :name => "purchase_order[comment]"
      assert_select "input#purchase_order_paid", :name => "purchase_order[paid]"
      assert_select "input#purchase_order_received", :name => "purchase_order[received]"
      assert_select "input#purchase_order_amount", :name => "purchase_order[amount]"
      assert_select "input#purchase_order_include_gst", :name => "purchase_order[include_gst]"
    end
  end
end
