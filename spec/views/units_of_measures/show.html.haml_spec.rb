require 'spec_helper'

describe "units_of_measures/show.html.haml" do
  before(:each) do
    @units_of_measure = assign(:units_of_measure, stub_model(UnitsOfMeasure,
      :name => "Name",
      :short_name => "Short Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
