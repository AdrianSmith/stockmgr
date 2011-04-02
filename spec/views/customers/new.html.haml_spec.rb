require 'spec_helper'

describe "customers/new.html.haml" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :name => "MyString",
      :description => "MyText",
      :website => "MyString",
      :email => "MyString",
      :account_name => "MyString",
      :account_number => "MyString",
      :delivery_rules => "MyText",
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :suburb_town => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postcode => "MyString",
      :country => "MyString",
      :phone_mobile => "MyString",
      :phone_home => "MyString",
      :phone_work => "MyString",
      :comment => "MyText",
      :account_balance_cached => "9.99"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path, :method => "post" do
      assert_select "input#customer_name", :name => "customer[name]"
      assert_select "textarea#customer_description", :name => "customer[description]"
      assert_select "input#customer_website", :name => "customer[website]"
      assert_select "input#customer_email", :name => "customer[email]"
      assert_select "input#customer_account_name", :name => "customer[account_name]"
      assert_select "input#customer_account_number", :name => "customer[account_number]"
      assert_select "textarea#customer_delivery_rules", :name => "customer[delivery_rules]"
      assert_select "input#customer_address_line_1", :name => "customer[address_line_1]"
      assert_select "input#customer_address_line_2", :name => "customer[address_line_2]"
      assert_select "input#customer_suburb_town", :name => "customer[suburb_town]"
      assert_select "input#customer_city", :name => "customer[city]"
      assert_select "input#customer_state", :name => "customer[state]"
      assert_select "input#customer_postcode", :name => "customer[postcode]"
      assert_select "input#customer_country", :name => "customer[country]"
      assert_select "input#customer_phone_mobile", :name => "customer[phone_mobile]"
      assert_select "input#customer_phone_home", :name => "customer[phone_home]"
      assert_select "input#customer_phone_work", :name => "customer[phone_work]"
      assert_select "textarea#customer_comment", :name => "customer[comment]"
      assert_select "input#customer_account_balance_cached", :name => "customer[account_balance_cached]"
    end
  end
end
