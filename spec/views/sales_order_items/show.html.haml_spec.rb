require 'spec_helper'

describe "sales_order_items/show.html.haml" do
  before(:each) do
    @sales_order_item = assign(:sales_order_item, stub_model(SalesOrderItem,
      :sales_order_id => 1,
      :product_id => 1,
      :quantity => "9.99",
      :custom_price => "9.99",
      :use_custom_price => false
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
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
