require 'spec_helper'

describe "storage_locations/index.html.haml" do
  before(:each) do
    assign(:storage_locations, [
      stub_model(StorageLocation,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(StorageLocation,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of storage_locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
