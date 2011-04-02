require 'spec_helper'

describe "storage_types/show.html.haml" do
  before(:each) do
    @storage_type = assign(:storage_type, stub_model(StorageType,
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
