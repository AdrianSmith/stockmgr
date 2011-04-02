require 'spec_helper'

describe "storage_locations/show.html.haml" do
  before(:each) do
    @storage_location = assign(:storage_location, stub_model(StorageLocation,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
