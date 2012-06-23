require 'spec_helper'

describe "sales_order_items/edit" do
  before(:each) do
    @sales_order_item = assign(:sales_order_item, stub_model(SalesOrderItem,
      :sales_order_id => 1,
      :product_id => 1,
      :quantity => "9.99"
    ))
  end

  it "renders the edit sales_order_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sales_order_items_path(@sales_order_item), :method => "post" do
      assert_select "input#sales_order_item_sales_order_id", :name => "sales_order_item[sales_order_id]"
      assert_select "input#sales_order_item_product_id", :name => "sales_order_item[product_id]"
      assert_select "input#sales_order_item_quantity", :name => "sales_order_item[quantity]"
    end
  end
end
