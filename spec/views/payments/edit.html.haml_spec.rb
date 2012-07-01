require 'spec_helper'

describe "payments/edit" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :amount => "9.99",
      :payment_type_id => 1,
      :customer_id => 1,
      :comment => "MyText"
    ))
  end

  it "renders the edit payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payments_path(@payment), :method => "post" do
      assert_select "input#payment_amount", :name => "payment[amount]"
      assert_select "input#payment_payment_type_id", :name => "payment[payment_type_id]"
      assert_select "input#payment_customer_id", :name => "payment[customer_id]"
      assert_select "textarea#payment_comment", :name => "payment[comment]"
    end
  end
end