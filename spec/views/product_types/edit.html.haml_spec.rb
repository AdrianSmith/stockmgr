require 'spec_helper'

describe "product_types/edit.html.haml" do
  before(:each) do
    @product_type = assign(:product_type, stub_model(ProductType,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit product_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_type_path(@product_type), :method => "post" do
      assert_select "input#product_type_name", :name => "product_type[name]"
      assert_select "textarea#product_type_description", :name => "product_type[description]"
    end
  end
end
