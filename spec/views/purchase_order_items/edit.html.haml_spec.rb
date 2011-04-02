require 'spec_helper'

describe "purchase_order_items/edit.html.haml" do
  before(:each) do
    @purchase_order_item = assign(:purchase_order_item, stub_model(PurchaseOrderItem,
      :product_id => 1,
      :purchase_order_id => 1,
      :quantity => "9.99"
    ))
  end

  it "renders the edit purchase_order_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchase_order_item_path(@purchase_order_item), :method => "post" do
      assert_select "input#purchase_order_item_product_id", :name => "purchase_order_item[product_id]"
      assert_select "input#purchase_order_item_purchase_order_id", :name => "purchase_order_item[purchase_order_id]"
      assert_select "input#purchase_order_item_quantity", :name => "purchase_order_item[quantity]"
    end
  end
end
