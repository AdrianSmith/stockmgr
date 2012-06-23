require 'spec_helper'

describe "product_prices/edit" do
  before(:each) do
    @product_price = assign(:product_price, stub_model(ProductPrice,
      :product_id => 1,
      :amount => "9.99"
    ))
  end

  it "renders the edit product_price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_prices_path(@product_price), :method => "post" do
      assert_select "input#product_price_product_id", :name => "product_price[product_id]"
      assert_select "input#product_price_amount", :name => "product_price[amount]"
    end
  end
end
