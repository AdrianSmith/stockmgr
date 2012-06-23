require 'spec_helper'

describe "product_prices/index" do
  before(:each) do
    assign(:product_prices, [
      stub_model(ProductPrice,
        :product_id => 1,
        :amount => "9.99"
      ),
      stub_model(ProductPrice,
        :product_id => 1,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of product_prices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
