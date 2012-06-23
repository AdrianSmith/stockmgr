require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
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
      ),
      stub_model(Customer,
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
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 2".to_s, :count => 2
    assert_select "tr>td", :text => "Suburb".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Home".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Work".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
