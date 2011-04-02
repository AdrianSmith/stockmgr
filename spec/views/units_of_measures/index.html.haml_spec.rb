require 'spec_helper'

describe "units_of_measures/index.html.haml" do
  before(:each) do
    assign(:units_of_measures, [
      stub_model(UnitsOfMeasure,
        :name => "Name",
        :short_name => "Short Name",
        :description => "MyText"
      ),
      stub_model(UnitsOfMeasure,
        :name => "Name",
        :short_name => "Short Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of units_of_measures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
