require 'spec_helper'

describe "certifiers/show.html.haml" do
  before(:each) do
    @certifier = assign(:certifier, stub_model(Certifier,
      :name => "Name",
      :description => "MyText",
      :website => "Website",
      :logo_image_url => "Logo Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Website/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Logo Image Url/)
  end
end
