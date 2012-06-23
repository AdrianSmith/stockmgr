require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name",
      :description => "MyText",
      :supplier_id => 1,
      :supplier_reference => "Supplier Reference",
      :brand => "Brand",
      :purchase_price => "9.99",
      :gst => false,
      :active => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Supplier Reference/)
    rendered.should match(/Brand/)
    rendered.should match(/9.99/)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
