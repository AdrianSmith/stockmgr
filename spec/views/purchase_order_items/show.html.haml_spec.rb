require 'spec_helper'

describe "purchase_order_items/show.html.haml" do
  before(:each) do
    @purchase_order_item = assign(:purchase_order_item, stub_model(PurchaseOrderItem,
      :product_id => 1,
      :purchase_order_id => 1,
      :quantity => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
