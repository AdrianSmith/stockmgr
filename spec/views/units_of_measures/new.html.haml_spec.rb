require 'spec_helper'

describe "units_of_measures/new.html.haml" do
  before(:each) do
    assign(:units_of_measure, stub_model(UnitsOfMeasure,
      :name => "MyString",
      :short_name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new units_of_measure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => units_of_measures_path, :method => "post" do
      assert_select "input#units_of_measure_name", :name => "units_of_measure[name]"
      assert_select "input#units_of_measure_short_name", :name => "units_of_measure[short_name]"
      assert_select "textarea#units_of_measure_description", :name => "units_of_measure[description]"
    end
  end
end
