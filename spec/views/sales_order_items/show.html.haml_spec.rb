require 'spec_helper'

describe "sales_order_items/show" do
  before(:each) do
    @sales_order_item = assign(:sales_order_item, stub_model(SalesOrderItem,
      :sales_order_id => 1,
      :product_id => 2,
      :quantity => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
  end
end
