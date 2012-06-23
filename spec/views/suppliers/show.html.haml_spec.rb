require 'spec_helper'

describe "suppliers/show" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :name => "Name",
      :description => "MyText",
      :website => "Website",
      :email => "Email",
      :account_name => "Account Name",
      :account_number => "Account Number",
      :delivery_rules => "MyText",
      :address_line_1 => "Address Line 1",
      :address_line_2 => "Address Line 2",
      :suburb => "Suburb",
      :city => "City",
      :postcode => "Postcode",
      :phone_mobile => "Phone Mobile",
      :phone_home => "Phone Home",
      :phone_work => "Phone Work",
      :comment => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Website/)
    rendered.should match(/Email/)
    rendered.should match(/Account Name/)
    rendered.should match(/Account Number/)
    rendered.should match(/MyText/)
    rendered.should match(/Address Line 1/)
    rendered.should match(/Address Line 2/)
    rendered.should match(/Suburb/)
    rendered.should match(/City/)
    rendered.should match(/Postcode/)
    rendered.should match(/Phone Mobile/)
    rendered.should match(/Phone Home/)
    rendered.should match(/Phone Work/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
