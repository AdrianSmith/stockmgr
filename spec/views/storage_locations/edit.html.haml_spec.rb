require 'spec_helper'

describe "storage_locations/edit.html.haml" do
  before(:each) do
    @storage_location = assign(:storage_location, stub_model(StorageLocation,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit storage_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => storage_location_path(@storage_location), :method => "post" do
      assert_select "input#storage_location_name", :name => "storage_location[name]"
      assert_select "textarea#storage_location_description", :name => "storage_location[description]"
    end
  end
end
