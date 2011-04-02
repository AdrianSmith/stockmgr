require 'spec_helper'

describe "certifiers/edit.html.haml" do
  before(:each) do
    @certifier = assign(:certifier, stub_model(Certifier,
      :name => "MyString",
      :description => "MyText",
      :website => "MyString",
      :logo_image_url => "MyString"
    ))
  end

  it "renders the edit certifier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => certifier_path(@certifier), :method => "post" do
      assert_select "input#certifier_name", :name => "certifier[name]"
      assert_select "textarea#certifier_description", :name => "certifier[description]"
      assert_select "input#certifier_website", :name => "certifier[website]"
      assert_select "input#certifier_logo_image_url", :name => "certifier[logo_image_url]"
    end
  end
end
