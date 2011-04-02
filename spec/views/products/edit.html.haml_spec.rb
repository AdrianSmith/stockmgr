require 'spec_helper'

describe "products/edit.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyText",
      :image_url => "MyString",
      :supplier_reference => "MyText",
      :product_type_id => 1,
      :supplier_id => 1,
      :certifier_id => 1,
      :storage_type_id => "MyString",
      :units_of_measure_id => 1,
      :minimum_quantity => 1,
      :storage_location_id => 1,
      :physical_form_id => 1,
      :stock_quantity => 1,
      :purchase_price => "9.99",
      :sale_price => "9.99",
      :include_gst => false
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_image_url", :name => "product[image_url]"
      assert_select "textarea#product_supplier_reference", :name => "product[supplier_reference]"
      assert_select "input#product_product_type_id", :name => "product[product_type_id]"
      assert_select "input#product_supplier_id", :name => "product[supplier_id]"
      assert_select "input#product_certifier_id", :name => "product[certifier_id]"
      assert_select "input#product_storage_type_id", :name => "product[storage_type_id]"
      assert_select "input#product_units_of_measure_id", :name => "product[units_of_measure_id]"
      assert_select "input#product_minimum_quantity", :name => "product[minimum_quantity]"
      assert_select "input#product_storage_location_id", :name => "product[storage_location_id]"
      assert_select "input#product_physical_form_id", :name => "product[physical_form_id]"
      assert_select "input#product_stock_quantity", :name => "product[stock_quantity]"
      assert_select "input#product_purchase_price", :name => "product[purchase_price]"
      assert_select "input#product_sale_price", :name => "product[sale_price]"
      assert_select "input#product_include_gst", :name => "product[include_gst]"
    end
  end
end
