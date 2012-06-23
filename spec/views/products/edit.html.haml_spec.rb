require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyText",
      :supplier_id => 1,
      :supplier_reference => "MyString",
      :brand => "MyString",
      :purchase_price => "9.99",
      :gst => false,
      :active => ""
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_supplier_id", :name => "product[supplier_id]"
      assert_select "input#product_supplier_reference", :name => "product[supplier_reference]"
      assert_select "input#product_brand", :name => "product[brand]"
      assert_select "input#product_purchase_price", :name => "product[purchase_price]"
      assert_select "input#product_gst", :name => "product[gst]"
      assert_select "input#product_active", :name => "product[active]"
    end
  end
end
