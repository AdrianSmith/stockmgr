require 'spec_helper'

describe "suppliers/index.html.haml" do
  before(:each) do
    assign(:suppliers, [
      stub_model(Supplier,
        :name => "Name",
        :description => "MyText",
        :website => "Website",
        :email => "Email",
        :account_name => "Account Name",
        :account_number => "Account Number",
        :delivery_rules => "MyText",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :suburb_town => "Suburb Town",
        :city => "City",
        :state => "State",
        :postcode => "Postcode",
        :country => "Country",
        :phone_mobile => "Phone Mobile",
        :phone_home => "Phone Home",
        :phone_work => "Phone Work",
        :comment => "MyText"
      ),
      stub_model(Supplier,
        :name => "Name",
        :description => "MyText",
        :website => "Website",
        :email => "Email",
        :account_name => "Account Name",
        :account_number => "Account Number",
        :delivery_rules => "MyText",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :suburb_town => "Suburb Town",
        :city => "City",
        :state => "State",
        :postcode => "Postcode",
        :country => "Country",
        :phone_mobile => "Phone Mobile",
        :phone_home => "Phone Home",
        :phone_work => "Phone Work",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Account Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Account Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address Line 1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address Line 2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Suburb Town".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone Mobile".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone Home".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone Work".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
