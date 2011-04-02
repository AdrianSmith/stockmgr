require 'spec_helper'

describe "customers/show.html.haml" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
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
      :comment => "MyText",
      :account_balance_cached => "9.99"
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
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Account Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Account Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Line 1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Line 2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Suburb Town/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Postcode/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Country/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone Mobile/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone Home/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone Work/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
