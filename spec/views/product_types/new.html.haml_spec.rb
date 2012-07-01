require 'spec_helper'

describe "product_types/new" do
  before(:each) do
    assign(:product_type, stub_model(ProductType,
      :name => "MyString",
      :description => "MyText",
      :active => false
    ).as_new_record)
  end

  it "renders new product_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_types_path, :method => "post" do
      assert_select "input#product_type_name", :name => "product_type[name]"
      assert_select "textarea#product_type_description", :name => "product_type[description]"
      assert_select "input#product_type_active", :name => "product_type[active]"
    end
  end
end