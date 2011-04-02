require 'spec_helper'

describe "physical_forms/edit.html.haml" do
  before(:each) do
    @physical_form = assign(:physical_form, stub_model(PhysicalForm,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit physical_form form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => physical_form_path(@physical_form), :method => "post" do
      assert_select "input#physical_form_name", :name => "physical_form[name]"
      assert_select "textarea#physical_form_description", :name => "physical_form[description]"
    end
  end
end
