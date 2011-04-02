require 'spec_helper'

describe "storage_types/new.html.haml" do
  before(:each) do
    assign(:storage_type, stub_model(StorageType,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new storage_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => storage_types_path, :method => "post" do
      assert_select "input#storage_type_name", :name => "storage_type[name]"
      assert_select "textarea#storage_type_description", :name => "storage_type[description]"
    end
  end
end
