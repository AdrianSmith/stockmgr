require 'spec_helper'

describe "certifiers/index.html.haml" do
  before(:each) do
    assign(:certifiers, [
      stub_model(Certifier,
        :name => "Name",
        :description => "MyText",
        :website => "Website",
        :logo_image_url => "Logo Image Url"
      ),
      stub_model(Certifier,
        :name => "Name",
        :description => "MyText",
        :website => "Website",
        :logo_image_url => "Logo Image Url"
      )
    ])
  end

  it "renders a list of certifiers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Logo Image Url".to_s, :count => 2
  end
end
