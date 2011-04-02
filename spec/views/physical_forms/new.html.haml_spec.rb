require 'spec_helper'

describe "physical_forms/new.html.haml" do
  before(:each) do
    assign(:physical_form, stub_model(PhysicalForm,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new physical_form form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => physical_forms_path, :method => "post" do
      assert_select "input#physical_form_name", :name => "physical_form[name]"
      assert_select "textarea#physical_form_description", :name => "physical_form[description]"
    end
  end
end
