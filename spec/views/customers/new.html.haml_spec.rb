require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :suburb => "MyString",
      :city => "MyString",
      :postcode => "MyString",
      :phone_mobile => "MyString",
      :phone_home => "MyString",
      :phone_work => "MyString",
      :account_balance_cached => "9.99",
      :active => false
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path, :method => "post" do
      assert_select "input#customer_first_name", :name => "customer[first_name]"
      assert_select "input#customer_last_name", :name => "customer[last_name]"
      assert_select "input#customer_email", :name => "customer[email]"
      assert_select "input#customer_address_line_1", :name => "customer[address_line_1]"
      assert_select "input#customer_address_line_2", :name => "customer[address_line_2]"
      assert_select "input#customer_suburb", :name => "customer[suburb]"
      assert_select "input#customer_city", :name => "customer[city]"
      assert_select "input#customer_postcode", :name => "customer[postcode]"
      assert_select "input#customer_phone_mobile", :name => "customer[phone_mobile]"
      assert_select "input#customer_phone_home", :name => "customer[phone_home]"
      assert_select "input#customer_phone_work", :name => "customer[phone_work]"
      assert_select "input#customer_account_balance_cached", :name => "customer[account_balance_cached]"
      assert_select "input#customer_active", :name => "customer[active]"
    end
  end
end
