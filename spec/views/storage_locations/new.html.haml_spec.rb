require 'spec_helper'

describe "storage_locations/new.html.haml" do
  before(:each) do
    assign(:storage_location, stub_model(StorageLocation,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new storage_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => storage_locations_path, :method => "post" do
      assert_select "input#storage_location_name", :name => "storage_location[name]"
      assert_select "textarea#storage_location_description", :name => "storage_location[description]"
    end
  end
end
