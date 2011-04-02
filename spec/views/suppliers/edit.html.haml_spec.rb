require 'spec_helper'

describe "suppliers/edit.html.haml" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
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
      :comment => "MyText"
    ))
  end

  it "renders the edit supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supplier_path(@supplier), :method => "post" do
      assert_select "input#supplier_name", :name => "supplier[name]"
      assert_select "textarea#supplier_description", :name => "supplier[description]"
      assert_select "input#supplier_website", :name => "supplier[website]"
      assert_select "input#supplier_email", :name => "supplier[email]"
      assert_select "input#supplier_account_name", :name => "supplier[account_name]"
      assert_select "input#supplier_account_number", :name => "supplier[account_number]"
      assert_select "textarea#supplier_delivery_rules", :name => "supplier[delivery_rules]"
      assert_select "input#supplier_address_line_1", :name => "supplier[address_line_1]"
      assert_select "input#supplier_address_line_2", :name => "supplier[address_line_2]"
      assert_select "input#supplier_suburb_town", :name => "supplier[suburb_town]"
      assert_select "input#supplier_city", :name => "supplier[city]"
      assert_select "input#supplier_state", :name => "supplier[state]"
      assert_select "input#supplier_postcode", :name => "supplier[postcode]"
      assert_select "input#supplier_country", :name => "supplier[country]"
      assert_select "input#supplier_phone_mobile", :name => "supplier[phone_mobile]"
      assert_select "input#supplier_phone_home", :name => "supplier[phone_home]"
      assert_select "input#supplier_phone_work", :name => "supplier[phone_work]"
      assert_select "textarea#supplier_comment", :name => "supplier[comment]"
    end
  end
end
