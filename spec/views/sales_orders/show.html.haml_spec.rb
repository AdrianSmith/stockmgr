require 'spec_helper'

describe "sales_orders/show" do
  before(:each) do
    @sales_order = assign(:sales_order, stub_model(SalesOrder,
      :customer_id => 1,
      :state => "State",
      :private_comment => "Private Comment",
      :public_comment => "Public Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/State/)
    rendered.should match(/Private Comment/)
    rendered.should match(/Public Comment/)
  end
end
