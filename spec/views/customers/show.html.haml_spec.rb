require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :address_line_1 => "Address Line 1",
      :address_line_2 => "Address Line 2",
      :suburb => "Suburb",
      :city => "City",
      :postcode => "Postcode",
      :phone_mobile => "Phone Mobile",
      :phone_home => "Phone Home",
      :phone_work => "Phone Work",
      :account_balance_cached => "9.99",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Address Line 1/)
    rendered.should match(/Address Line 2/)
    rendered.should match(/Suburb/)
    rendered.should match(/City/)
    rendered.should match(/Postcode/)
    rendered.should match(/Phone Mobile/)
    rendered.should match(/Phone Home/)
    rendered.should match(/Phone Work/)
    rendered.should match(/9.99/)
    rendered.should match(/false/)
  end
end
